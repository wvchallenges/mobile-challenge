package com.wave.daniel.wave_danieloh.models;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by Daniel on 2016-11-12.
 */

public class IncomeAccount implements Parcelable {

    private long id;
    private String url;


    protected IncomeAccount(Parcel in) {
        id = in.readLong();
        url = in.readString();
    }

    public static final Creator<IncomeAccount> CREATOR = new Creator<IncomeAccount>() {
        @Override
        public IncomeAccount createFromParcel(Parcel in) {
            return new IncomeAccount(in);
        }

        @Override
        public IncomeAccount[] newArray(int size) {
            return new IncomeAccount[size];
        }
    };

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

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeLong(id);
        parcel.writeString(url);
    }
}
