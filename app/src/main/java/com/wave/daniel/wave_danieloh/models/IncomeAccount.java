package com.wave.daniel.wave_danieloh.models;

import android.os.Parcel;

/**
 * Created by Daniel on 2016-11-12.
 */

public class IncomeAccount{

    private long id;
    private String url;


    protected IncomeAccount(Parcel in) {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
