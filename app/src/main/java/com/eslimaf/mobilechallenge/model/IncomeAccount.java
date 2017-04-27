package com.eslimaf.mobilechallenge.model;

import android.os.Parcel;
import android.os.Parcelable;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class IncomeAccount implements Parcelable {

    @SerializedName("id")
    @Expose
    private Integer id;
    @SerializedName("url")
    @Expose
    private String url;
    public final static Parcelable.Creator<IncomeAccount> CREATOR = new Creator<IncomeAccount>() {


        @SuppressWarnings({
                "unchecked"
        })
        public IncomeAccount createFromParcel(Parcel in) {
            IncomeAccount instance = new IncomeAccount();
            instance.id = ((Integer) in.readValue((Integer.class.getClassLoader())));
            instance.url = ((String) in.readValue((String.class.getClassLoader())));
            return instance;
        }

        public IncomeAccount[] newArray(int size) {
            return (new IncomeAccount[size]);
        }

    };

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeValue(id);
        dest.writeValue(url);
    }

    public int describeContents() {
        return 0;
    }

}
