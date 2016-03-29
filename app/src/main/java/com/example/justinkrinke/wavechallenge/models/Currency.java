package com.example.justinkrinke.wavechallenge.models;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 * Currency model for JSON
 */
public class Currency {

    @SerializedName("url")
    @Expose
    private String url;
    @SerializedName("code")
    @Expose
    private String code;
    @SerializedName("symbol")
    @Expose
    private String symbol;
    @SerializedName("name")
    @Expose
    private String name;

    /**
     *
     * @return
     *     The url
     */
    public String getUrl() {
        return url;
    }

    /**
     *
     * @param url
     *     The url
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     *
     * @return
     *     The code
     */
    public String getCode() {
        return code;
    }

    /**
     *
     * @param code
     *     The code
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     *
     * @return
     *     The symbol
     */
    public String getSymbol() {
        return symbol;
    }

    /**
     *
     * @param symbol
     *     The symbol
     */
    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    /**
     *
     * @return
     *     The name
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @param name
     *     The name
     */
    public void setName(String name) {
        this.name = name;
    }

}

