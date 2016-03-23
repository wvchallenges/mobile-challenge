package com.example.parkeraldricmar.wave;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.text.DecimalFormat;

/**
 * Created by parkeraldricmar on 2016-03-22.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Product {

    @JsonProperty("name")
    private String name;

    @JsonProperty("price")
    private int price;

    @Override
    public String toString() {
        return getName() + ": " + getPriceText();
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public String getPriceText() {
        return new DecimalFormat("'$'0.00").format(price);
    }
}
