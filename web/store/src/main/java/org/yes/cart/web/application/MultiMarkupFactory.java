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

package org.yes.cart.web.application;

import org.apache.wicket.markup.IMarkupCache;
import org.apache.wicket.markup.MarkupFactory;

/**
 * User: Igor Azarny iazarny@yahoo.com
 * Date: 7/10/11
 * Time: 11:16 AM
 */
public class MultiMarkupFactory extends MarkupFactory {

    private MultiMarkupCache multiMarkupCache;

    /**
     * POJO factory that creates a new instance every time
     */
    public MultiMarkupFactory() {
        //
    }

    /**
     * {@inheritDoc}
     */
    public IMarkupCache getMarkupCache() {
        if (multiMarkupCache == null) {
            multiMarkupCache = getNewInstance();
        }
        return multiMarkupCache;
    }

    /**
     * Hook for Spring Ioc lookup method. MultiMarkupCache is Wicket application specific
     * so it has to be setup as prototype and provided by lookup method.
     *
     * @return instance
     */
    public MultiMarkupCache getNewInstance() {
        return new MultiMarkupCache();
    }

    /**
     * {@inheritDoc}
     */
    public boolean hasMarkupCache() {
        return multiMarkupCache != null;
    }


}
