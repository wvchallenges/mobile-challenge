package com.eslimaf.mobilechallenge;

import com.eslimaf.mobilechallenge.infrastructure.waveapi.MockCallApi;
import com.eslimaf.mobilechallenge.infrastructure.waveapi.WaveApi;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

public class ProductsPresenterTest {
    @InjectMocks
    ProductsPresenter mProductsPresenter;
    @Mock
    ProductsContract.View mMockView;
    @Mock
    WaveApi mMockWaveApi;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        when(mMockWaveApi.getProductsByBusinessId(anyString())).thenReturn(new MockCallApi());
        mProductsPresenter = new ProductsPresenter(mMockWaveApi);
    }

    @After
    public void tearDown() {

    }

    @Test
    public void attachView() throws Exception {
        mProductsPresenter.attachView(mMockView);
        mProductsPresenter.getProducts();
        verify(mMockView).showProgress();
    }

    @Test
    public void getProducts() throws Exception {
        mProductsPresenter.getProducts();
        verify(mMockWaveApi).getProductsByBusinessId(anyString());
    }

}