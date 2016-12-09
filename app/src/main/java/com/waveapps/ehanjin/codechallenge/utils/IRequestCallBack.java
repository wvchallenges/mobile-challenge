package com.waveapps.ehanjin.codechallenge.utils;

/**
 * Created by SJ on 12/7/16.
 */

public interface IRequestCallBack<T> {
    void onSuccess(T param);
    void onError();
}
