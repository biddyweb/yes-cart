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
package org.yes.cart.domain.entity.impl;


import org.yes.cart.constants.AttributeNamesKeys;
import org.yes.cart.domain.entity.*;

import java.util.*;

/**
 * User: Igor Azarny iazarny@yahoo.com
 * Date: 27 0ct 2012
 * Time: 9:10 AM
 */
public class ShopEntity implements org.yes.cart.domain.entity.Shop, java.io.Serializable {

    private long shopId;
    private long version;

    private String code;
    private String name;
    private String description;
    private String fspointer;
    private String imageVaultFolder;
    private Set<ShopUrl> shopUrl = new HashSet<ShopUrl>(0);
    private Collection<ShopExchangeRate> exchangerates = new ArrayList<ShopExchangeRate>(0);
    private Collection<ShopAdvPlace> advertisingPlaces = new ArrayList<ShopAdvPlace>(0);
    private Collection<ShopDiscount> shopDiscountRules = new ArrayList<ShopDiscount>(0);
    private Collection<AttrValueShop> attributes = new ArrayList<AttrValueShop>(0);
    private SeoEntity seoInternal;
    private Collection<ShopCategory> shopCategory = new ArrayList<ShopCategory>(0);
    private Date createdTimestamp;
    private Date updatedTimestamp;
    private String createdBy;
    private String updatedBy;
    private String guid;

    public ShopEntity() {
    }



    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFspointer() {
        return this.fspointer;
    }

    public void setFspointer(String fspointer) {
        this.fspointer = fspointer;
    }

    public String getImageVaultFolder() {
        return this.imageVaultFolder;
    }

    public void setImageVaultFolder(String imageVaultFolder) {
        this.imageVaultFolder = imageVaultFolder;
    }

    public Set<ShopUrl> getShopUrl() {
        return this.shopUrl;
    }

    public void setShopUrl(Set<ShopUrl> shopUrl) {
        this.shopUrl = shopUrl;
    }

    public Collection<ShopExchangeRate> getExchangerates() {
        return this.exchangerates;
    }

    public void setExchangerates(Collection<ShopExchangeRate> exchangerates) {
        this.exchangerates = exchangerates;
    }

    public Collection<ShopAdvPlace> getAdvertisingPlaces() {
        return this.advertisingPlaces;
    }

    public void setAdvertisingPlaces(Collection<ShopAdvPlace> advertisingPlaces) {
        this.advertisingPlaces = advertisingPlaces;
    }

    public Collection<ShopDiscount> getShopDiscountRules() {
        return this.shopDiscountRules;
    }

    public void setShopDiscountRules(Collection<ShopDiscount> shopDiscountRules) {
        this.shopDiscountRules = shopDiscountRules;
    }

    public Collection<AttrValueShop> getAttributes() {
        return this.attributes;
    }

    public void setAttributes(Collection<AttrValueShop> attributes) {
        this.attributes = attributes;
    }

    public SeoEntity getSeoInternal() {
        return this.seoInternal;
    }

    public void setSeoInternal(SeoEntity seo) {
        this.seoInternal = seo;
    }

    public Collection<ShopCategory> getShopCategory() {
        return this.shopCategory;
    }

    public void setShopCategory(Collection<ShopCategory> shopCategory) {
        this.shopCategory = shopCategory;
    }

    public Date getCreatedTimestamp() {
        return this.createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    public Date getUpdatedTimestamp() {
        return this.updatedTimestamp;
    }

    public void setUpdatedTimestamp(Date updatedTimestamp) {
        this.updatedTimestamp = updatedTimestamp;
    }

    public String getCreatedBy() {
        return this.createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getUpdatedBy() {
        return this.updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public String getGuid() {
        return this.guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public long getShopId() {
        return this.shopId;
    }

    public long getId() {
        return this.shopId;
    }

    public void setShopId(long shopId) {
        this.shopId = shopId;
    }

    public long getVersion() {
        return version;
    }

    public void setVersion(final long version) {
        this.version = version;
    }

    public String getSupportedCurrencies() {
        final AttrValueShop attrValueShop = getAttributeByCode(AttributeNamesKeys.SUPPORTED_CURRENCIES);
        if (attrValueShop != null) {
            return attrValueShop.getVal();
        }
        return null;
    }

    public String getDefaultCurrency() {
        String currencies = getSupportedCurrencies();
        if (currencies != null) {
            return currencies.split(",")[0];
        }
        return null;
    }

    public List<String> getSupportedCurrenciesAsList() {
        final String currencies = getSupportedCurrencies();
        if (currencies != null) {
            return Arrays.asList(currencies.split(","));
        }
        return null;
    }


    public Collection<AttrValueShop> getAttributesByCode(final String attributeCode) {
        final Collection<AttrValueShop> result = new ArrayList<AttrValueShop>();
        if (attributeCode != null && this.attributes != null) {
            for (AttrValueShop attrValue : this.attributes) {
                if (attrValue.getAttribute().getCode().equals(attributeCode)) {
                    result.add(attrValue);
                }
            }
        }
        return result;
    }

    public AttrValueShop getAttributeByCode(final String attributeCode) {
        if (attributeCode == null) {
            return null;
        }
        if (this.attributes != null) {
            for (AttrValueShop attrValue : this.attributes) {
                if (attrValue.getAttribute() != null && attributeCode.equals(attrValue.getAttribute().getCode())) {
                    return attrValue;
                }
            }
        }
        return null;
    }

    @Override
    public String toString() {
        return this.getClass().getName() + this.getShopId();
    }

    public boolean isB2ProfileActive() {
        final AttrValueShop avs = getAttributeByCode(
                AttributeNamesKeys.SHOP_B2B);
        if (avs != null) {
            return Boolean.valueOf(avs.getVal());
        }
        return false;
    }

    private String markupFolder = null;

    public String getMarkupFolder() {
        if (markupFolder == null) {
            synchronized (this) {
                markupFolder = "/" + fspointer + "/markup";
            }
        }
        return markupFolder;
    }

    private String mailFolder = null;

    public String getMailFolder() {
        if (mailFolder == null) {
            synchronized (this) {
                mailFolder = "/" + fspointer + "/mail";
            }
        }
        return mailFolder;
    }

    public String getDefaultShopUrl() {
        for (ShopUrl shopUrl : getShopUrl()) {
            if (shopUrl.getUrl().endsWith("localhost") || shopUrl.getUrl().contains("127.0.0.1")) {
                continue;
            }
            return "http://" + shopUrl.getUrl();
        }
        return "";
    }


    public Seo getSeo() {
        SeoEntity seo = getSeoInternal();
        if (seo == null) {
            seo = new SeoEntity();
            this.setSeoInternal(seo);
        }
        return seo;
    }

    public void setSeo(final Seo seo) {
        this.setSeoInternal((SeoEntity) seo);
    }


    /** {@inheritDoc} */
    public int hashCode() {
        return (int) (shopId ^ (shopId >>> 32));
    }

}

