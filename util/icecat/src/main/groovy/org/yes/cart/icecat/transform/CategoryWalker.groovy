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





package org.yes.cart.icecat.transform

import org.yes.cart.icecat.transform.xml.CategoryHandler
import org.yes.cart.icecat.transform.domain.Category
import javax.xml.parsers.SAXParserFactory
import org.xml.sax.InputSource
import org.yes.cart.icecat.transform.xml.ProductPointerHandler
import org.yes.cart.icecat.transform.xml.CategoryFeaturesListHandler
import org.yes.cart.icecat.transform.xml.ProductHandler

/**
 * User: Igor Azarny iazarny@yahoo.com
 * Date: 5/7/12
 * Time: 10:11 PM
 */
class CategoryWalker {

    Context context;

    CategoryWalker(Context context) {

        this.context = context;

    }


    void collectData() {

        print("Parsing categories...")
        def FileInputStream refs = new FileInputStream("$context.dataDirectory/export/freexml.int/refs.xml");
        def handler = new CategoryHandler(context.categories, context.langId.toString())
        def reader = SAXParserFactory.newInstance().newSAXParser().XMLReader
        reader.setContentHandler(handler)
        reader.parse(new InputSource(refs))
        refs.close();
        println("Added " + handler.counter + " categories...")


        println("Parsing categories features...")
        refs = new FileInputStream("$context.dataDirectory/export/freexml.int/refs.xml");
        def categoryFeaturelistHandler = new CategoryFeaturesListHandler(
                handler.categoryMap,
                context.langId.toString())
        reader = SAXParserFactory.newInstance().newSAXParser().XMLReader
        reader.setContentHandler(categoryFeaturelistHandler)
        reader.parse(new InputSource(refs))
        refs.close();
        println("Added " + categoryFeaturelistHandler.counter + " features to categories...")

        println("Parsing product indexes...")
        def indexes = new FileInputStream("$context.dataDirectory/export/freexml.int/$context.productDir/index.html");
        def productPointerHandler = new ProductPointerHandler(handler.categoryMap, context.mindata, context.productsPerCategoryLimit);
        def productReadeReader = SAXParserFactory.newInstance().newSAXParser().XMLReader
        productReadeReader.setContentHandler(productPointerHandler)
        productReadeReader.parse(new InputSource(indexes))
        println("Added " + productPointerHandler.counter + " products to categories...")

        println("Download product data...")
        //check the cache and download product's xml if need
        String cacheFolderName = createCacheFolder()
        downloadProducts(handler.categoryMap, cacheFolderName)
        parseProducts(handler.categoryMap, cacheFolderName)

        String pictCacheFolder = createPictureCacheFolder();
        downloadProductPictures(handler.categoryMap, pictCacheFolder)
        println("Added products data to categories...")

        println("Generating CSV files...")

        def rootDir = "$context.dataDirectory/export/freexml.int/csvresult/$context.productDir";

        //create folder for csv
        new File(rootDir).mkdirs();


        StringBuilder csv = new StringBuilder();

        csv.append("parent category name; category name\n");
        handler.categoryMap.values().each { csv.append(it.toProductType())}
        new File("$rootDir/category.csv").write(csv.toString(), 'UTF-8');

        csv = new StringBuilder();
        csv.append("name;attrname;mandatory;searchable;num;navigable;navtype;rangenav\n")
        handler.categoryMap.values().each { csv.append(it.toProductTypeAttr())}
        new File("$rootDir/producttypeattr.csv").write(csv.toString(), 'UTF-8');

        csv = new StringBuilder();
        csv.append("name;code;description;guid\n")
        handler.categoryMap.values().each { csv.append(it.toArrtViewGroup())}
        new File("$rootDir/attributeviewgroup.csv").write(csv.toString(), 'UTF-8');

        csv = new StringBuilder();
         csv.append("producttype;viewgroupname;arributes;guid\n")
        handler.categoryMap.values().each { csv.append(it.toProductTypeAttrViewGroup())}
        new File("$rootDir/productypeattributeviewgroup.csv").write(csv.toString(), 'UTF-8');

        new File("$rootDir/brand.csv").write(dumpBrands(handler.categoryMap), 'UTF-8');


        new File("$rootDir/productentity.csv").write(dumpProducts(handler.categoryMap), 'UTF-8');

        // Main warehouse is part of initial data
        // new File("$rootDir/warehouse.csv").write("Ware house code;name;description\nMain;Main warehouse;Main warehouse", 'UTF-8');

        println("All done...")

    }


    private def dumpProducts(Map<String, Category> categoryMap) {
        StringBuilder builder = new StringBuilder();
        builder.append("name;category;producttype;brand;availability;skucode;qty;price;barcode;attributes;description\n");
        categoryMap.values().each {
            Category cat = it;
            cat.product.each {
                builder.append(it.toString());
            }
        }
        return builder.toString();
    }

    private def dumpBrands(Map<String, Category> categoryMap) {
        Set<String> rez = new HashSet<String>();
        categoryMap.values().each {
            Category cat = it;
            cat.product.each {
                rez.add(it.Supplier);
            }
        }
        StringBuilder builder = new StringBuilder();
        builder.append("brand;description\n");
        rez.each {
            builder.append(it)
            builder.append(";")
            builder.append(it)
            builder.append("\n")
        }
        return builder.toString();
    }



    private def parseProducts(Map<String, Category> categoryMap, String cacheFolderName) {
        categoryMap.values().each {
            it.productPointer.each {

                String productFile = cacheFolderName + it.path.substring(1 + it.path.lastIndexOf("/"));
                def FileInputStream prodis = new FileInputStream(productFile);
                def handler = new ProductHandler(categoryMap)
                def reader = SAXParserFactory.newInstance().newSAXParser().XMLReader
                reader.setContentHandler(handler)
                reader.parse(new InputSource(prodis))
                prodis.close();


            }
        }

        Set<String> refsCatIds = new HashSet<String>();
        categoryMap.values().each {
            it.product.relatedCategories.each {
                refsCatIds.addAll(it);
            }

        }

        println "Related categories " + refsCatIds;

        
    }

    private def downloadProductPictures(Map<String, Category> categoryMap, String cacheFolderName) {
        def authString = "$context.login:$context.pwd".getBytes().encodeBase64().toString()
        def cacheFolder = createPictureCacheFolder();
        categoryMap.values().each {
            it.product.each {
                char idx = 'a';

                String productName = it.Title.replace("_", "-").replace(" ", "-").replace("?", "-").replace(".", "-");
                String skuCode = it.Prod_id;

                downloadProductPicture(it.HighPic, authString, cacheFolder, idx++, productName, skuCode);
                it.productPicture.each {

                    //limit to 3 pictures only, because of import size
                    if (idx != 'd') {
                        downloadProductPicture(it, authString, cacheFolder, idx++, productName, skuCode);
                    }

                }



            }
        }
    }

    private def downloadProductPicture(String url, String authString, String cacheFolderName, char idx, String productName, String skuCode) {
        try {
            //preformat filename for import
            String productFile = cacheFolderName + productName + "_" + skuCode + "_" + idx + url.substring(url.lastIndexOf("."));


            if (!(new File(productFile).exists())) {
                try {
                    URLConnection conn = "$url".toURL().openConnection();
                    conn.setRequestProperty("Authorization", "Basic ${authString}")
                    InputStream input = conn.getInputStream()
                    def output = new BufferedOutputStream(new FileOutputStream(productFile));
                    output << input
                    input.close();
                    output.close();
                    println "Downloaded $url into $productFile"

                } catch (FileNotFoundException e) {
                    println "File $url not exists on remote server, skipped"
                }


            } else {
                println "Skipped $url"
            }

        } catch (Exception e) {
            println "cant download $url, because of $e.message"
        }
    }

    private def createPictureCacheFolder() {
        def cacheFolderName = "$context.dataDirectory/export/freexml.int/pictcache/";
        File cacheFolderFile = new File(cacheFolderName);
        if (!cacheFolderFile.exists()) {
            cacheFolderFile.mkdirs();
        }
        return cacheFolderName
    }




    private def downloadProducts(Map<String, Category> categoryMap, String cacheFolderName) {
        def authString = "$context.login:$context.pwd".getBytes().encodeBase64().toString()
        categoryMap.values().each {
            it.productPointer.each {
                String productFile = cacheFolderName + it.path.substring(1 + it.path.lastIndexOf("/"));
                downloadSingleProduct(productFile, authString, it)
            }
        }
    }


    private downloadSingleProduct(String productFile, authString, productPointer) {
        if (!(new File(productFile).exists())) {

            def conn = "$context.url$productPointer.path".toURL().openConnection();
            conn.setRequestProperty("Authorization", "Basic ${authString}")
            new File(productFile) << conn.getInputStream().text
            println "Downloaded $productPointer.Model_Name"
        //} else {
           // println "Skipped $it.Model_Name"
        }
    }

    private def createCacheFolder() {
        def cacheFolderName = "$context.dataDirectory/export/freexml.int/xmlcache/$context.productDir/";
        File cacheFolderFile = new File(cacheFolderName);
        if (!cacheFolderFile.exists()) {
            cacheFolderFile.mkdirs();
        }
        return cacheFolderName
    }


}