package com.waveapps.ehanjin.codechallenge.model;

import android.os.Parcel;
import android.os.Parcelable;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by SJ on 12/7/16.
 */

public class Account implements Parcelable {
    // JSON Node names
    public static final String TAG_ID = "id";
    public static final String TAG_URL = "url";

    private long id;
    private String url;

    public Account() {
    }

    protected Account(Parcel in) {
        id = in.readLong();
        url = in.readString();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeLong(id);
        dest.writeString(url);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<Account> CREATOR = new Creator<Account>() {
        @Override
        public Account createFromParcel(Parcel in) {
            return new Account(in);
        }

        @Override
        public Account[] newArray(int size) {
            return new Account[size];
        }
    };

    public static Account fromJson(JSONObject jsonObject) {
        Account obj = new Account();
        // Deserialize json into object fields
        try {
            obj.id = jsonObject.getLong(TAG_ID);
            obj.url = jsonObject.getString(TAG_URL);

        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        }
        return obj;
    }

    public long getId() {
        return id;
    }

    public String getUrl() {
        return url;
    }

    public Account setId(long id) {
        this.id = id;
        return this;
    }

    public Account setUrl(String url) {
        this.url = url;
        return this;
    }
}
