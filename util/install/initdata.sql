-- Igor Azarny iazarny@yahoo.com.
-- Initial data.
--

SET character_set_client=utf8;
SET character_set_connection=utf8;


INSERT INTO TBRAND(BRAND_ID, NAME, DESCRIPTION) VALUES(1,'HP','HP');
INSERT INTO TBRAND(BRAND_ID, NAME, DESCRIPTION) VALUES(2,'Dell, Inc.','Dell, Inc.');
INSERT INTO TBRAND(BRAND_ID, NAME, DESCRIPTION) VALUES(3,'Gateway','Gateway');
INSERT INTO TBRAND(BRAND_ID, NAME, DESCRIPTION) VALUES(4,'Apple','Apple');
INSERT INTO TBRAND(BRAND_ID, NAME, DESCRIPTION) VALUES(5,'Asus','Asus');
INSERT INTO TBRAND(BRAND_ID, NAME, DESCRIPTION) VALUES(6,'Sony','Sony');

INSERT INTO TASSOCIATION(ASSOCIATION_ID, CODE, NAME, DESCRIPTION)  VALUES (1, 'accessories' , 'Accessories' , 'Product accessories');
INSERT INTO TASSOCIATION(ASSOCIATION_ID, CODE, NAME, DESCRIPTION)  VALUES (2, 'up' , 'Up sell' , 'Up sell');
INSERT INTO TASSOCIATION(ASSOCIATION_ID, CODE, NAME, DESCRIPTION)  VALUES (3, 'cross' , 'Cross sell' , 'Cross sell');
INSERT INTO TASSOCIATION(ASSOCIATION_ID, CODE, NAME, DESCRIPTION)  VALUES (4, 'buywiththis' , 'Buy with this products' , 'Shoppers also buy with this product');


INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE) VALUES (1000, 'java.lang.String', 'String');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE) VALUES (1001, 'java.lang.String', 'URI');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE) VALUES (1002, 'java.lang.String', 'URL');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE) VALUES (1003, 'java.lang.String', 'Image');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE) VALUES (1004, 'java.lang.String', 'CommaSeparatedList');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE) VALUES (1005, 'java.lang.Float', 'Float');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE) VALUES (1006, 'java.lang.Integer', 'Integer');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE) VALUES (1007, 'java.lang.String', 'Phone');



INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, CODE, NAME, DESCRIPTION) VALUES (1000, 'SYSTEM', 'System settings.', 'System wide settings');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, CODE, NAME, DESCRIPTION) VALUES (1001, 'SHOP', 'Shop settings.', '');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, CODE, NAME, DESCRIPTION) VALUES (1002, 'CATEGORY', 'Category settings.', '');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, CODE, NAME, DESCRIPTION) VALUES (1003, 'PRODUCT', 'Product settings.', '');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, CODE, NAME, DESCRIPTION) VALUES (1004, 'SKU', 'Product sku settings.', '');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, CODE, NAME, DESCRIPTION) VALUES (1005, 'BRAND', 'Brand settings.', '');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, CODE, NAME, DESCRIPTION) VALUES (1006, 'CUSTOMER', 'Customer settings.', '');



INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  1000,  'SYSTEM_DEFAULT_SHOP',  1,  NULL,  'System. Default shop',
  'This value will be used for redirections when shop can not be resolved by http request', 1002,  1000);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  1001,  'BRAND_IMAGE',  1,  NULL,  'Brand image',  null,  1003, 1005);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  1002,  'CATEGORY_ITEMS_PER_PAGE',  0,  NULL,  'Category item per page settings',
   'Category item per page settings with failover',  1004, 1002);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  1003,  'MATERIAL',  0,  NULL,  'Material',  'Material',   1000, 1003);


INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  1006,  'CURRENCY',  0,  NULL,  'Currensies',  'Supported currensies by shop. First one is default',  1004, 1001);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  1040,  'SHOP_B2B',  1,  NULL,  'Is B2B profile for this shop',  'Is B2B profile for this shop',  1000, 1001);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  1007,  'SYSTEM_IMAGE_VAULT',  1,  NULL,  'Brand, product and skus image repository',
  'Brand, product and skus image repository', 1000,  1000);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1008,  'IMAGE0',  1,  NULL,  'Product default image',  'Product default image',  1003, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1009,  'IMAGE1',  0,  NULL,  'First product alternative image',  'First product alternative image',  1003, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1010,  'IMAGE2',  0,  NULL,  'Second product alternative image',  'Second product alternative image',  1003, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1011,  'IMAGE3',  0,  NULL,  'Third product alternative image',  'Third product alternative image',  1003, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1012,  'IMAGE4',  0,  NULL,  'Fourth product alternative image',  'Fourth product alternative image',  1003, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1013,  'IMAGE5',  0,  NULL,  'Fifth product alternative image',  'Fifth product alternative image',  1003, 1003);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1014,  'SKUIMAGE0',  0,  NULL,  'Product sku default image',  'Product sku default image',  1003, 1004);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1015,  'SKUIMAGE1',  0,  NULL,  'First sku alternative image',  'First sku alternative image',  1003, 1004);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1016,  'SKUIMAGE2',  0,  NULL,  'Second sku alternative image',  'Second sku alternative image',  1003, 1004);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1017,  'SKUIMAGE3',  0,  NULL,  'Third sku alternative image',  'Third sku alternative image',  1003, 1004);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1018,  'SKUIMAGE4',  0,  NULL,  'Fourth sku alternative image',  'Fourth sku alternative image',  1003, 1004);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1019,  'SKUIMAGE5',  0,  NULL,  'Fifth sku alternative image',  'Fifth sku alternative image',  1003, 1004);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1020,  'WEIGHT',  0,  NULL,  'Weight',  'Weight',  1005, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1021,  'LENGTH',  0,  NULL,  'Length',  'Length',  1005, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1022,  'WIDTH',  0,  NULL,  'Width',  'Width',  1005, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1023,  'HEIGHT',  0,  NULL,  'Height',  'Height',  1005, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1024,  'COLOR',  0,  NULL,  'Color',  'Color',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1025,  'BATTERY',  0,  NULL,  'Battery',  'Battery',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1026,  'NETWORK',  0,  NULL,  'Network',  'Network',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1027,  'MEMORY',  0,  NULL,  'Memory',  'Memory',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1028,  'SCREEN-SIZE',  0,  NULL,  'Screen size',  'Screen size',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1029,  'CPU',  0,  NULL,  'Cpu',  'Cpu',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1030,  'STORAGE-TYPE',  0,  NULL,  'Storage type',  'Storage type',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1031,  'STORAGE-SIZE',  0,  NULL,  'Storage size',  'Storage size',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1032,  'OS',  0,  NULL,  'Os',  'Os',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1033,  'BATTERY-SIZE',  0,  NULL,  'Battery performance',  'Battery performance',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1034,  'PORTS',  0,  NULL,  'Ports',  'Ports',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1035,  'CAMERA',  0,  NULL,  'Camera',  'Camera',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1036,  'FEATURES',  0,  NULL,  'Features',  'Features',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1037,  'SCREEN-RESOLUTION',  0,  NULL,  'Resolution',  'Screen resolution',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1038,  'SCREEN-COLOR-DEPTH',  0,  NULL,  'Color depth',  'Color depth',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)  VALUES (  1039,  'PART-NUMBER',  0,  NULL,  'Part number',  'Part number',  1000, 1003);




INSERT INTO TPRODUCTTYPE (PRODUCTTYPE_ID , NAME, DESCRIPTION, UISEARCHTEMPLATE, SERVICE, ENSEMBLE, SHIPABLE)  VALUES (500,'Laptop','Laptop','default', 0,0,1);

INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)  VALUES (50000,          'WEIGHT',          500,      70 ,   1,         1,        1, 'R' ,
'<rangeList serialization="custom"><unserializable-parents/><list><default><size>10</size></default><int>10</int><range><range><first class="string">0.10</first><second class="string">1.00</second></range></range><range><range><first class="string">1.00</first><second class="string">2.00</second></range></range><range><range><first class="string">2.00</first><second class="string">3.00</second></range></range><range><range><first class="string">3.00</first><second class="string">4.00</second></range></range><range><range><first class="string">4.00</first><second class="string">5.00</second></range></range><range><range><first class="string">5.00</first><second class="string">6.00</second></range></range><range><range><first class="string">6.00</first><second class="string">7.00</second></range></range><range><range><first class="string">7.00</first><second class="string">8.00</second></range></range><range><range><first class="string">8.00</first><second class="string">10.00</second></range></range><range><range><first class="string">10.00</first><second class="string">20.00</second></range></range></list></rangeList>'
);
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50001,   'LENGTH',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50002,   'WIDTH',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50003,   'HEIGHT',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50004,   'COLOR',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50005,   'BATTERY',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50006,   'NETWORK',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50007,   'MEMORY',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50008,   'SCREEN-SIZE',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50009,   'CPU',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50010,   'STORAGE-TYPE',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50011,   'STORAGE-SIZE',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50012,   'OS',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50013,   'BATTERY-SIZE',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50014,   'PORTS',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50015,   'CAMERA',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50016,   'FEATURES',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50017,   'SCREEN-RESOLUTION',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50018,   'SCREEN-COLOR-DEPTH',   500,          50 ,   1,         1,       1,    'S' ,       '');
INSERT INTO TPRODUCTTYPEATTR(PRODTYPEATTR_ID, CODE, PRODUCTTYPE_ID, RANK, VISIBLE, SIMULARITY, NAV, NAV_TYPE, RANGE_NAV)   VALUES (50019,   'PART-NUMBER',   500,          50 ,   1,         1,       1,    'S' ,       '');


INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (1,'General','General');
INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (2,'Display','Display');
INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (3,'Memory','Memory');
INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (4,'Processor','Processor');
INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (5,'Communications','Communications');
INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (6,'Digital Camera','Digital Camera');
INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (7,'Multimedia Functionality','Multimedia Functionality');
INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (8,'Input Device','Input Device');
INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (9,'Battery','Battery');
INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (10,'Misc','Misc');
INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (11,'Os','Os');
INSERT INTO TATTRVIEWGROUP (ATTRVIEWGROUP_ID, NAME, DESCRIPTION) VALUES (12,'Storage','Storage');

INSERT INTO TPRODTYPEATTRVIEWGROUP(PRODTYPEATTRIBUTEGROUP_ID, PRODUCTTYPE_ID, ATTRVIEWGROUP_ID, ATTRCODELIST, RANK)   VALUES (50001, 500, 1, 'PART-NUMBER,WEIGHT,LENGTH,WIDTH,HEIGHT', 1);
INSERT INTO TPRODTYPEATTRVIEWGROUP(PRODTYPEATTRIBUTEGROUP_ID, PRODUCTTYPE_ID, ATTRVIEWGROUP_ID, ATTRCODELIST, RANK)   VALUES (50002, 500, 2, 'SCREEN-RESOLUTION,SCREEN-SIZE,SCREEN-COLOR-DEPTH', 2);
INSERT INTO TPRODTYPEATTRVIEWGROUP(PRODTYPEATTRIBUTEGROUP_ID, PRODUCTTYPE_ID, ATTRVIEWGROUP_ID, ATTRCODELIST, RANK)   VALUES (50004, 500, 3, 'MEMORY', 3);
INSERT INTO TPRODTYPEATTRVIEWGROUP(PRODTYPEATTRIBUTEGROUP_ID, PRODUCTTYPE_ID, ATTRVIEWGROUP_ID, ATTRCODELIST, RANK)   VALUES (50005, 500, 4, 'CPU', 4);
INSERT INTO TPRODTYPEATTRVIEWGROUP(PRODTYPEATTRIBUTEGROUP_ID, PRODUCTTYPE_ID, ATTRVIEWGROUP_ID, ATTRCODELIST, RANK)   VALUES (50006, 500, 5, 'NETWORK', 7);
INSERT INTO TPRODTYPEATTRVIEWGROUP(PRODTYPEATTRIBUTEGROUP_ID, PRODUCTTYPE_ID, ATTRVIEWGROUP_ID, ATTRCODELIST, RANK)   VALUES (50007, 500, 6, 'CAMERA', 8);
INSERT INTO TPRODTYPEATTRVIEWGROUP(PRODTYPEATTRIBUTEGROUP_ID, PRODUCTTYPE_ID, ATTRVIEWGROUP_ID, ATTRCODELIST, RANK)   VALUES (50008, 500, 9, 'BATTERY,BATTERY-SIZE', 6);
INSERT INTO TPRODTYPEATTRVIEWGROUP(PRODTYPEATTRIBUTEGROUP_ID, PRODUCTTYPE_ID, ATTRVIEWGROUP_ID, ATTRCODELIST, RANK)   VALUES (50009, 500, 11, 'OS', 9);
INSERT INTO TPRODTYPEATTRVIEWGROUP(PRODTYPEATTRIBUTEGROUP_ID, PRODUCTTYPE_ID, ATTRVIEWGROUP_ID, ATTRCODELIST, RANK)   VALUES (50010, 500, 12, 'STORAGE-TYPE,STORAGE-SIZE', 5);



INSERT INTO TAVAILABILITY ( AVAILABILITY_ID,NAME,DESCRIPTION) VALUES (1,'In stock','Show id available in stock');
INSERT INTO TAVAILABILITY ( AVAILABILITY_ID,NAME,DESCRIPTION) VALUES (2,'Preorder','Pre order' );
INSERT INTO TAVAILABILITY ( AVAILABILITY_ID,NAME,DESCRIPTION) VALUES (4,'Back order','Back order' );
INSERT INTO TAVAILABILITY ( AVAILABILITY_ID,NAME,DESCRIPTION) VALUES (8,'Always','Available at any time' );



INSERT INTO TNPASYSTEM (NPASYSTEM_ID, CODE, NAME, DESCRIPTION)  VALUES (100,'NPASYSTEM','Yes e-commerce platform', 'System table');

INSERT INTO TSYSTEMATTRVALUE ( ATTRVALUE_ID,  VAL,  CODE, NPASYSTEM_ID)   VALUES (1000,'http://gadget.yes-cart.com:8080/webshopwicket','SYSTEM_DEFAULT_SHOP',100);

INSERT INTO TSYSTEMATTRVALUE ( ATTRVALUE_ID,  VAL,  CODE, NPASYSTEM_ID)   VALUES (1002,'10,20,40','SEARCH_ITEMS_PER_PAGE',100);

INSERT INTO TSYSTEMATTRVALUE ( ATTRVALUE_ID,  VAL,  CODE, NPASYSTEM_ID)  VALUES (1003,'common/imagevault','SYSTEM_IMAGE_VAULT',100);



INSERT INTO TWAREHOUSE (WAREHOUSE_ID, CODE, NAME, DESCRIPTION) VALUES (1, 'Main warehouse', 'Main warehouse', null);



INSERT INTO TSHOP (SHOP_ID, NAME, DESCRIPTION, FSPOINTER, CODE)  VALUES (10, 'Gadget universe', 'Gadget universe shop', 'default', 'SHOP10');
INSERT INTO TSHOP (SHOP_ID, NAME, DESCRIPTION, FSPOINTER, CODE)  VALUES (20, 'Mobile universe', 'Mobile universe shop', 'mobile', 'SHOP20');
INSERT INTO TSHOP (SHOP_ID, NAME, DESCRIPTION, FSPOINTER, CODE)  VALUES (30, 'Game universe', 'Game universe shop', 'game', 'SHOP30');

INSERT INTO TSHOPWAREHOUSE(SHOPWAREHOUSE_ID,SHOP_ID,WAREHOUSE_ID) VALUES (1, 10 ,1);
INSERT INTO TSHOPWAREHOUSE(SHOPWAREHOUSE_ID,SHOP_ID,WAREHOUSE_ID) VALUES (2, 20 ,1);
INSERT INTO TSHOPWAREHOUSE(SHOPWAREHOUSE_ID,SHOP_ID,WAREHOUSE_ID) VALUES (3, 30 ,1);

INSERT INTO TSHOPATTRVALUE(ATTRVALUE_ID,VAL,CODE,SHOP_ID)  VALUES (10, 'USD,EUR,UAH', 'CURRENCY', 10);

INSERT INTO TSTOREEXCHANGERATE (SHOPEXCHANGERATE_ID, FROMCURRENCY, TOCURRENCY, SHOP_ID, RATE)  VALUES(1,'EUR','UAH',10, 11.38);


INSERT INTO TSHOPURL (STOREURL_ID, SHOP_ID, URL )  VALUES (10, 10, 'gadget.yes-cart.com');
INSERT INTO TSHOPURL (STOREURL_ID, SHOP_ID, URL )  VALUES (11, 10, 'www.gadget.yes-cart.com');

INSERT INTO TSHOPURL (STOREURL_ID, SHOP_ID, URL )  VALUES (20, 20, 'mobile.yes-cart.com');
INSERT INTO TSHOPURL (STOREURL_ID, SHOP_ID, URL )  VALUES (21, 20, 'www.mobile.yes-cart.com');

INSERT INTO TSHOPURL (STOREURL_ID, SHOP_ID, URL )  VALUES (30, 30, 'game.yes-cart.com');
INSERT INTO TSHOPURL (STOREURL_ID, SHOP_ID, URL )  VALUES (31, 30, 'www.game.yes-cart.com');

INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (100, 100, 0, 'root', 'The root category','default');

INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (200, 100, 0, 'Cell Phones', 'Cell Phones','default');
INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (300, 100, 10, 'Camcorders', 'Camcorders','default');
INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE, PRODUCTTYPE_ID) VALUES (400, 100, 20, 'Laptops', 'Laptops','default', 500);
INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (500, 100, 30, 'TV''s', 'TV''s','default');
INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (600, 100, 40, 'Car tech', 'Car tech','default');
INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (700, 100, 50, 'All categories', 'The root category','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (710, 700, 90, 'Appliances', 'Appliances','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (720, 700, 100, 'Cell phone accessories', 'Cell phone accessories','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (730, 700, 10, 'Desktop', 'Desktop','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (740, 700, 60, 'Games and gear', 'Games and gear','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (750, 700, 0, 'GPS', 'GPS','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (760, 700, 55, 'Hard drives and burners', 'Hard drives and burners','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (770, 700, 110, 'Headphones', 'Headphones','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (780, 700, 0, 'Home video', 'Home video','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (790, 700, 9, 'Internet access', 'Internet access','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (800, 700, 105, 'MP3 players', 'MP3 players','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (810, 700, 20, 'Monitors', 'Monitors','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (820, 700, 50, 'Networking and Wi-Fi', 'Networking and Wi-Fi','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (830, 700, 40, 'Peripherals', 'Peripherals','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (840, 700, 30, 'Printers', 'Printers','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (850, 700, 57, 'Software', 'Software','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (860, 700, 90, 'Tablets', 'Tablets','default');
  INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE) VALUES (870, 700, 95, 'Components', 'Components','default');


INSERT INTO TSHOPCATEGORY (SHOPCATEGORY_ID, RANK, SHOP_ID, CATEGORY_ID) VALUES (1,5,10,200);
INSERT INTO TSHOPCATEGORY (SHOPCATEGORY_ID, RANK, SHOP_ID, CATEGORY_ID) VALUES (2,5,10,300);
INSERT INTO TSHOPCATEGORY (SHOPCATEGORY_ID, RANK, SHOP_ID, CATEGORY_ID) VALUES (3,5,10,400);
INSERT INTO TSHOPCATEGORY (SHOPCATEGORY_ID, RANK, SHOP_ID, CATEGORY_ID) VALUES (4,5,10,500);
INSERT INTO TSHOPCATEGORY (SHOPCATEGORY_ID, RANK, SHOP_ID, CATEGORY_ID) VALUES (5,5,10,600);
INSERT INTO TSHOPCATEGORY (SHOPCATEGORY_ID, RANK, SHOP_ID, CATEGORY_ID) VALUES (6,5,10,700);



INSERT INTO TSEO (SEO_ID, URI, TITLE, METAKEYWORDS, METADESCRIPTION)
  VALUES ( 7000, 'HP TouchPad (16GB)','HP TouchPad (16GB)','','');
INSERT INTO TPRODUCT (PRODUCT_ID, CODE, NAME, DESCRIPTION, BRAND_ID, PRODUCTTYPE_ID, AVAILABILITY_ID, SEO_ID)
  VALUES (7000,  'hp-touchpad-16gb',  'HP TouchPad (16GB)',   'The Touchpad is by no means slow. It has 1GB of RAM and dual core 1.2 GHz processors. ',    1,   500,  1,  7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000000, 'WEIGHT' , '1.6', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000001, 'WIDTH' , '9.4 in', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000002, 'HEIGHT' , '0.6 in', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000003, 'LENGTH' , '7.5 in', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000004, 'SCREEN-RESOLUTION' , '1024x768', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000005, 'SCREEN-SIZE' , '9.7 in', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000006, 'SCREEN-COLOR-DEPTH' , '18 bit', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000007, 'MEMORY' , '16 Gb integrated', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000008, 'CPU' , 'Qualcomm Snapdragon APQ8060, 1.2 GHz', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000009, 'NETWORK' , '802.11b/g/n, Bluetooth 2.1 EDR', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000010, 'CAMERA' , 'Front-facing Camera', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000011, 'BATTERY-SIZE' , '6300 mAh', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000012, 'BATTERY' , 'Lithium ion battery', 7000);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000013, 'OS' , 'Web Os', 7000);
INSERT INTO TSKU(SKU_ID,PRODUCT_ID,CODE,NAME,DESCRIPTION,RANK) VALUES (7000,  7000,  'hp-touchpad-16gb', 'HP TouchPad (16GB)',  'HP TouchPad (16GB)',  1 );
INSERT INTO TSKUPRICE (SKUPRICE_ID, SKU_ID, SHOP_ID, CURRENCY, QTY, REGULAR_PRICE)  VALUES (7000, 7000, 10, 'USD', 1, 499.99);

INSERT INTO TSEO (SEO_ID, URI, TITLE, METAKEYWORDS, METADESCRIPTION)
  VALUES ( 7001, 'hp-probook-5330m','HP Probook 5330m','','');
INSERT INTO TPRODUCT (PRODUCT_ID, CODE, NAME, DESCRIPTION, BRAND_ID, PRODUCTTYPE_ID, AVAILABILITY_ID, SEO_ID)
  VALUES (7001,  'hp-probook-5330m',  'HP Probook 5330m',   'Compact and solidly-built, the HP ProBook 5330m is a cleanly made 13-inch business laptop with up-to-date processor specs and a glare-free matte screen.',    1,   500,  1,  7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000020, 'WEIGHT' , '1.6', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000021, 'WIDTH' , '12.9 in', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000022, 'HEIGHT' , '1 in', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000023, 'LENGTH' , '8.9 in', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000024, 'SCREEN-RESOLUTION' , '1366x768', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000025, 'SCREEN-SIZE' , '13.3 in', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000027, 'MEMORY' , '4 GB)', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000028, 'CPU' , '2nd Gen Core i3, Intel i3-2310M / 2.1 GHz', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000029, 'NETWORK' , 'Wireless cellular modem, HSPA,GPRS,GSM,EDGE', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000030, 'CAMERA' , 'Integrated', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000031, 'BATTERY-SIZE' , '41 Wh', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000032, 'BATTERY' , '4-cell Lithium polymer', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000033, 'STORAGE-SIZE' , '500 GB', 7001);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000034, 'STORAGE-TYPE' , 'HDD. Serial ATA-300 - 7200 rpm', 7001);
INSERT INTO TSKU(SKU_ID,PRODUCT_ID,CODE,NAME,DESCRIPTION,RANK) VALUES (7001,  7001,  'hp-probook-5330m', 'HP Probook 5330m',  'HP Probook 5330m',  1 );
INSERT INTO TSKUPRICE (SKUPRICE_ID, SKU_ID, SHOP_ID, CURRENCY, QTY, REGULAR_PRICE)  VALUES (7002, 7002, 10, 'USD', 1, 850.00);

INSERT INTO TSEO (SEO_ID, URI, TITLE, METAKEYWORDS, METADESCRIPTION)
  VALUES ( 7002, 'hp-pavilion-dv6t-6000','HP Pavilion dv6t-6000','','');
INSERT INTO TPRODUCT (PRODUCT_ID, CODE, NAME, DESCRIPTION, BRAND_ID, PRODUCTTYPE_ID, AVAILABILITY_ID, SEO_ID)
  VALUES (7002,  'PH-P-6T-6000',  'HP Pavilion dv6t-6000',   'Improved design, Beats audio, new USB 3.0 ports, an HD Webcam, fingerprint sensor, a variety of configurations ranging from budget to high-end, and second-gen Core i-series processors are all part of the HP Pavilion dv6t''s design makeover.',    1,   500,  1,  7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000040, 'WEIGHT' , '5.78', 7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000041, 'SCREEN-RESOLUTION' , '1366x768', 7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000042, 'SCREEN-SIZE' , '15.6 in', 7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000043, 'MEMORY' , '6 GB', 7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000044, 'CPU' , 'Intel 2nd Gen Core i5', 7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000045, 'OS' , 'Windows 7 Home Premium 64-bit', 7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000046, 'NETWORK' , 'Wireless cellular modem, HSPA,GPRS,GSM,EDGE', 7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000047, 'CAMERA' , 'Integrated', 7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000048, 'BATTERY-SIZE' , '41 Wh', 7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000049, 'BATTERY' , '4-cell Lithium polymer', 7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000050, 'STORAGE-SIZE' , '500 GB', 7002);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000051, 'STORAGE-TYPE' , 'HDD. Serial ATA-300 - 7200 rpm', 7002);
INSERT INTO TSKU(SKU_ID,PRODUCT_ID,CODE,NAME,DESCRIPTION,RANK) VALUES (7002,  7002,  'PH-P-6T-6000', 'HP Pavilion dv6t-6000',  'HP Pavilion dv6t-6000',  1 );
INSERT INTO TSKUPRICE (SKUPRICE_ID, SKU_ID, SHOP_ID, CURRENCY, QTY, REGULAR_PRICE)  VALUES (7002, 7002, 10, 'USD', 1, 749.23);

INSERT INTO TSEO (SEO_ID, URI, TITLE, METAKEYWORDS, METADESCRIPTION)
  VALUES ( 7003, 'hp-pavilion-dv7-4165','HP Pavilion dv7-4165dx','','');
INSERT INTO TPRODUCT (PRODUCT_ID, CODE, NAME, DESCRIPTION, BRAND_ID, PRODUCTTYPE_ID, AVAILABILITY_ID, SEO_ID)
  VALUES (7003,  'DV7-4165',  'HP Pavilion dv7-4165',   'Anyone looking for a relatively inexpensive entertainment laptop is going to be thrilled with what the HP Pavilion dv7-4165dx ($779.99 list at Best Buy) has to offer.',    1,   500,  1,  7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000060, 'WEIGHT' , '5.78', 7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000061, 'SCREEN-RESOLUTION' , '1600x600', 7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000062, 'SCREEN-SIZE' , '17.3 in', 7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000063, 'MEMORY' , '4 GB', 7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000064, 'CPU' , 'AMD Phenom II N850 Triple-Core, 2.2 Ghz', 7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000065, 'OS' , 'Microsoft Windows 7 Home Premium 64-bit', 7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000066, 'NETWORK' , '802.11b, 802.11g, 802.11n', 7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000067, 'CAMERA' , 'Integrated', 7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000068, 'BATTERY-SIZE' , '41 Wh', 7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000069, 'BATTERY' , '4-cell Lithium polymer', 7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000070, 'STORAGE-SIZE' , '640 GB', 7003);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000071, 'STORAGE-TYPE' , 'HDD. Serial ATA-300 - 7200 rpm', 7003);
INSERT INTO TSKU(SKU_ID,PRODUCT_ID,CODE,NAME,DESCRIPTION,RANK) VALUES (7003,  7003,  'DV7-4165', 'HP Pavilion dv7-4165',  'HP Pavilion dv7-4165',  1 );
INSERT INTO TSKUPRICE (SKUPRICE_ID, SKU_ID, SHOP_ID, CURRENCY, QTY, REGULAR_PRICE)  VALUES (7003, 7003, 10, 'USD', 1, 599.99);

INSERT INTO TSEO (SEO_ID, URI, TITLE, METAKEYWORDS, METADESCRIPTION)
  VALUES ( 7004, 'dell-xps-17-3d','Dell XPS 17 3D','','');
INSERT INTO TPRODUCT (PRODUCT_ID, CODE, NAME, DESCRIPTION, BRAND_ID, PRODUCTTYPE_ID, AVAILABILITY_ID, SEO_ID)
  VALUES (7004,  'D-XPS-17-3D',  'Dell XPS 17 3D',   'The Dell XPS 17 3D is a sharp-looking desktop replacement that can handle 3D content, as well as output 3D movies and games to a compatible 3DTV. Highly configurable, the more-expensive options are powerful indeed ',    1,   500,  1,  7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000080, 'WEIGHT' , '6.00', 7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000081, 'SCREEN-RESOLUTION' , '1600x600', 7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000082, 'SCREEN-SIZE' , '17.3 in', 7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000083, 'MEMORY' , '4 GB', 7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000084, 'CPU' , 'Intel Core i7', 7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000085, 'OS' , 'Microsoft Windows 7 Home Premium 64-bit', 7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000086, 'NETWORK' , '802.11b, 802.11g, 802.11n', 7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000087, 'CAMERA' , 'Integrated', 7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000088, 'BATTERY-SIZE' , '90 Wh', 7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000089, 'BATTERY' , 'Lithium Ion', 7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000090, 'STORAGE-SIZE' , '640 GB', 7004);
INSERT INTO TPRODUCTATTRVALUE (ATTRVALUE_ID, CODE, VAL, PRODUCT_ID) VALUES (3000091, 'STORAGE-TYPE' , 'HDD. Serial ATA-300 - 7200 rpm', 7004);
INSERT INTO TSKU(SKU_ID,PRODUCT_ID,CODE,NAME,DESCRIPTION,RANK) VALUES (7004,  7004,  'D-XPS-17-3D', 'Dell XPS 17 3D',  'Dell XPS 17 3D',  1 );
INSERT INTO TSKUPRICE (SKUPRICE_ID, SKU_ID, SHOP_ID, CURRENCY, QTY, REGULAR_PRICE)  VALUES (7004, 7004, 10, 'USD', 1, 1409.00);


INSERT INTO TPRODUCTCATEGORY (PRODUCTCATEGORY_ID, CATEGORY_ID, PRODUCT_ID, RANK)  VALUES (100, 400 , 7000, 0);
INSERT INTO TPRODUCTCATEGORY (PRODUCTCATEGORY_ID, CATEGORY_ID, PRODUCT_ID, RANK)  VALUES (101, 400 , 7001, 0);
INSERT INTO TPRODUCTCATEGORY (PRODUCTCATEGORY_ID, CATEGORY_ID, PRODUCT_ID, RANK)  VALUES (102, 400 , 7002, 0);
INSERT INTO TPRODUCTCATEGORY (PRODUCTCATEGORY_ID, CATEGORY_ID, PRODUCT_ID, RANK)  VALUES (103, 400 , 7003, 0);
INSERT INTO TPRODUCTCATEGORY (PRODUCTCATEGORY_ID, CATEGORY_ID, PRODUCT_ID, RANK)  VALUES (104, 400 , 7004, 0);



INSERT INTO TSHOPWAREHOUSE( SHOPWAREHOUSE_ID , SHOP_ID, WAREHOUSE_ID ) VALUES (1, 10, 1);


INSERT INTO TSKUWAREHOUSE(SKUWAREHOUSE_ID, WAREHOUSE_ID, SKU_ID, QUANTITY, RESERVED) VALUES (1, 1, 7000, 4, 0);
INSERT INTO TSKUWAREHOUSE(SKUWAREHOUSE_ID, WAREHOUSE_ID, SKU_ID, QUANTITY, RESERVED) VALUES (2, 1, 7001, 12, 0);
INSERT INTO TSKUWAREHOUSE(SKUWAREHOUSE_ID, WAREHOUSE_ID, SKU_ID, QUANTITY, RESERVED) VALUES (3, 1, 7002, 3, 0);
INSERT INTO TSKUWAREHOUSE(SKUWAREHOUSE_ID, WAREHOUSE_ID, SKU_ID, QUANTITY, RESERVED) VALUES (4, 1, 7003, 7, 0);
INSERT INTO TSKUWAREHOUSE(SKUWAREHOUSE_ID, WAREHOUSE_ID, SKU_ID, QUANTITY, RESERVED) VALUES (5, 1, 7004, 11, 0);









INSERT INTO TROLE (CODE, DESCRIPTION) VALUES ('ROLE_SMADMIN', 'Admin');

-- default admin password 1234567
INSERT INTO TMANAGER (EMAIL, FIRSTNAME, LASTNAME, PASSWORD) VALUES ('admin@yes-cart.com', 'Yes', 'Admin', 'fcea920f7412b5da7be0cf42b8c93759');

--INSERT INTO TMANAGERROLE (EMAIL, CODE) VALUES ('admin@yes-cart.com', 'WICKETSHOP_ADMIN');
INSERT INTO TMANAGERROLE (EMAIL, CODE) VALUES ('admin@yes-cart.com', 'ROLE_SMADMIN');


COMMIT;