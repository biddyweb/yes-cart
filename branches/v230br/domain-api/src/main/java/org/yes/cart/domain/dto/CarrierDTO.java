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

package org.yes.cart.domain.dto;

import org.yes.cart.domain.entity.Identifiable;

import java.util.Map;

/**
 * Carrier DTO interface.
 * <p/>
 * User: Igor Azarny iazarny@yahoo.com
 * Date: 07-May-2011
 * Time: 11:12:54
 */
public interface CarrierDTO extends Identifiable {

    /**
     * Get pk value.
     *
     * @return pk value.
     */
    long getCarrierId();

    /**
     * Set pk value.
     *
     * @param carrierId pk value.
     */
    void setCarrierId(long carrierId);

    /**
     * Get carrier name.
     *
     * @return carrier name
     */
    String getName();

    /**
     * Set carrier name.
     *
     * @param name name to set.
     */
    void setName(String name);


    /**
     * Carrier name.
     *
     * @return localised locale => name pairs.
     */
    Map<String, String> getDisplayNames();

    /**
     * Get carrier name
     *
     * @param names localised locale => name pairs
     */
    void setDisplayNames(Map<String, String> names);


    /**
     * Get carrier description.
     *
     * @return description
     */
    String getDescription();

    /**
     * Set carrier description.
     *
     * @param description description
     */
    void setDescription(String description);

    /**
     * Carrier description.
     *
     * @return localised locale => name pairs.
     */
    Map<String, String> getDisplayDescriptions();

    /**
     * Get carrier description
     *
     * @param names localised locale => name pairs
     */
    void setDisplayDescriptions(Map<String, String> names);


    /**
     * Is carrier perform world wide delivery.
     *
     * @return true if performs delivery.
     */
    boolean isWorldwide();

    /**
     * Set world wide delivery flag.
     *
     * @param worldwide world wide delivery flag
     */
    void setWorldwide(boolean worldwide);

    /**
     * Is carrier perform country devilery.
     *
     * @return true if performs country delivery.
     */
    boolean isCountry();

    /**
     * Set country delivery flag.
     *
     * @param country country delivery flag.
     */
    void setCountry(boolean country);

    /**
     * Is carrier perform state devilery.
     *
     * @return true if performs state delivery.
     */

    boolean isState();

    /**
     * Set state delivery flag.
     *
     * @param state state devivery flag
     */
    void setState(boolean state);

    /**
     * Is carrier perform local (city) devilery.
     *
     * @return true if performs local (city)  delivery.
     */

    boolean isLocal();

    /**
     * Set local delivery flag.
     *
     * @param local local delivery flag.
     */
    void setLocal(boolean local);


}
