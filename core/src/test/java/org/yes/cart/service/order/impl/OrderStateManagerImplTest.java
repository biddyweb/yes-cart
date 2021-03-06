/*
 * Copyright 2009 Igor Azarnyi, Denys Pavlov
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

package org.yes.cart.service.order.impl;

import org.junit.Before;
import org.junit.Test;
import org.yes.cart.BaseCoreDBTestCase;
import org.yes.cart.service.order.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

/**
 * User: Igor Azarny iazarny@yahoo.com
 * Date: 09-May-2011
 * Time: 14:12:54
 */
// TODO: YC-64 simplify using JMock
public class OrderStateManagerImplTest extends BaseCoreDBTestCase {

    private Map<String, OrderEventHandler> handlersOk;
    private Map<String, OrderEventHandler> handlersFailed;
    private Map<String, List<? extends OrderStateTransitionListener>> afterListenersMapOk;
    private Map<String, List<? extends OrderStateTransitionListener>> beforeListenersMapOk;
    private boolean afterTransitionListenerWasFired;
    private boolean beforeTransitionListenerWasFired;
    private boolean afterTransitionDynamicListenerWasFired;
    private boolean beforeTransitionDynamicListenerWasFired;

    @Before
    public void setUp()  {
        afterTransitionListenerWasFired = false;
        beforeTransitionListenerWasFired = false;
        handlersOk = new HashMap<String, OrderEventHandler>() {{
            put("payment.ok", new OrderEventHandler() {
                public boolean handle(OrderEvent orderEvent) {
                    return true;
                }
            });
        }};
        handlersFailed = new HashMap<String, OrderEventHandler>() {{
            put("payment.ok", new OrderEventHandler() {
                public boolean handle(OrderEvent orderEvent) {
                    return false;
                }
            });
        }};
        final List<OrderStateAfterTransitionListener> orderStateAfterTransitionListeners = new ArrayList<OrderStateAfterTransitionListener>() {{
            add(new OrderStateAfterTransitionListener() {
                public boolean onEvent(OrderEvent orderEvent) {
                    afterTransitionListenerWasFired = true;
                    return true;
                }
            });
        }};
        afterListenersMapOk = new HashMap<String, List<? extends OrderStateTransitionListener>>() {{
            put("payment.ok", orderStateAfterTransitionListeners);
        }};
        final List<OrderStateBeforeTransitionListener> orderStateBeforeTransitionListeners = new ArrayList<OrderStateBeforeTransitionListener>() {{
            add(new OrderStateBeforeTransitionListener() {
                public boolean onEvent(OrderEvent orderEvent) {
                    beforeTransitionListenerWasFired = true;
                    return true;
                }
            });
        }};
        beforeListenersMapOk = new HashMap<String, List<? extends OrderStateTransitionListener>>() {{
            put("payment.ok", orderStateBeforeTransitionListeners);
        }};

        super.setUp();
    }

    /**
     * Nothing happened with wrong event id
     *
     * @throws Exception
     */
    @Test
    public void testFireTransitionUnmappedEvent() throws Exception {
        OrderStateManagerImpl orderStateManager = new OrderStateManagerImpl(handlersOk, beforeListenersMapOk, afterListenersMapOk);
        assertFalse(orderStateManager.fireTransition(
                new OrderEventImpl("some.unhandled.cart.event", null)
        ));
        assertFalse(afterTransitionListenerWasFired);
        assertFalse(beforeTransitionListenerWasFired);
    }

    /**
     * Prove, that before and after listeners and  handler fired for event
     *
     * @throws Exception
     */
    @Test
    public void testFireTransitionHandledEvent() throws Exception {
        OrderStateManagerImpl orderStateManager = new OrderStateManagerImpl(handlersOk, beforeListenersMapOk, afterListenersMapOk);
        assertTrue(orderStateManager.fireTransition(
                new OrderEventImpl("payment.ok", null)
        ));
        assertTrue(afterTransitionListenerWasFired);
        assertTrue(beforeTransitionListenerWasFired);
    }

    /**
     * Prove, that before listeners only before listener is fired if handler result is false
     *
     * @throws Exception
     */
    @Test
    public void testFireTransitionUnhandledEvent() throws Exception {
        OrderStateManagerImpl orderStateManager = new OrderStateManagerImpl(handlersFailed, beforeListenersMapOk, afterListenersMapOk);
        assertFalse(orderStateManager.fireTransition(
                new OrderEventImpl("payment.ok", null)
        ));
        assertTrue(beforeTransitionListenerWasFired);
        assertFalse(afterTransitionListenerWasFired);
    }

    /**
     * Test to prove, that dynamic handles are operational.
     *
     * @throws Exception
     */
    @Test
    public void testAddBeforeAfterTransitionListenerDynamicHandlers() throws Exception {
        OrderStateManagerImpl orderStateManager = new OrderStateManagerImpl(handlersOk, beforeListenersMapOk, afterListenersMapOk);
        List<OrderStateTransitionListener> afterTransitionEventHandlers = (List<OrderStateTransitionListener>)
                orderStateManager.getAfterListenersMap().get("payment.ok");
        afterTransitionEventHandlers.add(new OrderStateAfterTransitionListener() {
            public boolean onEvent(OrderEvent orderEvent) {
                afterTransitionDynamicListenerWasFired = true;
                return true;
            }
        });
        List<OrderStateTransitionListener> beforeTransitionEventHandlers =
                (List<OrderStateTransitionListener>) orderStateManager.getBeforeListenersMap().get("payment.ok");
        beforeTransitionEventHandlers.add(
                new OrderStateBeforeTransitionListener() {
                    public boolean onEvent(OrderEvent orderEvent) {
                        beforeTransitionDynamicListenerWasFired = true;
                        return true;
                    }
                }
        );
        assertTrue(orderStateManager.fireTransition(
                new OrderEventImpl("payment.ok", null)
        ));
        assertTrue(afterTransitionDynamicListenerWasFired);
        assertTrue(beforeTransitionDynamicListenerWasFired);
    }
}
