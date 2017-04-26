package com.eslimaf.mobilechallenge.infrastructure.waveapi;

import org.junit.Test;

import static org.junit.Assert.assertNotNull;

public class WaveApiServiceTest {

    @Test
    public void testInstanceNotNull() {
        //Null object
        WaveApiService testInstance;
        testInstance = WaveApiService.getInstance();
        assertNotNull(testInstance);
    }
}