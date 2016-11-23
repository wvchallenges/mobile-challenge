package com.wave.daniel.wave_danieloh.engine.url_manager;

/**
 * Created by Daniel on 2016-11-12.
 */

public class UrlManager {

    public static final String WAVE_HEADER_URL = "https://api.waveapps.com";
    public static final String PRODUCTS_LIST_URL = "/businesses/{business_id}/products/";
    public static final String BUSINESS_ID_PARAM  = "{business_id}";


    /**
     * Construct URL to get product list from the server
     * */
    public static String getBusinessListUrl(String businessUrl) {
        StringBuilder urlBuilder = new StringBuilder();
        urlBuilder.append(WAVE_HEADER_URL);
        String productsListUrl = PRODUCTS_LIST_URL;
        urlBuilder.append(productsListUrl.replace(BUSINESS_ID_PARAM, businessUrl));

        return urlBuilder.toString();
    }


}
