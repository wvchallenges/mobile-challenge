package com.adeel.waveapp;

/**
 * Created by Adeel on 09-Jan-17.
 * Interface for completing AsyncTasks
 */
public interface TaskCompletionInterface {
    void onSuccess(String result);
    void onError(int result);
}
