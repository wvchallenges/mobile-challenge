package com.kannan.sample.waveapp.viewmodel;

import android.app.Application;

import androidx.annotation.NonNull;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.Observer;

import com.kannan.sample.waveapp.BuildConfig;
import com.kannan.sample.waveapp.facade.ProductsApiFacade;
import com.kannan.sample.waveapp.model.Product;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLog;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Callback;
import retrofit2.Response;

import static org.junit.Assert.assertEquals;
import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.verify;

@RunWith(RobolectricTestRunner.class)
@Config(constants = BuildConfig.class, sdk = 23, manifest = Config.NONE)
public class ProductsViewModelTest {
    Application application;

    @Mock
    MutableLiveData<List<Product>> mockLiveData;

    @Mock
    ProductsApiFacade mockProductsApiFacade;

    @Captor
    ArgumentCaptor<LifecycleOwner> lifecycleOwnerArgumentCaptor;

    @Captor
    ArgumentCaptor<Observer> observerArgumentCaptor;

    @Captor
    ArgumentCaptor<Callback<List<Product>>> callbackCaptor;

    @Captor
    ArgumentCaptor<String> businessIDArgumentCaptor;

    @Before
    public void setUp() {
        ShadowLog.stream = System.out;
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testObserve(){
        //Arrange
        ProductsViewModel viewModel = new ProductsViewModel(application, null, mockLiveData);
        LifecycleOwner lifecycleOwner = () -> null;
        Observer<List<Product>> observer = products -> {};

        //Act
        viewModel.observe(lifecycleOwner, observer);

        //Assert
        verify(mockLiveData).observe(lifecycleOwnerArgumentCaptor.capture(), observerArgumentCaptor.capture());
        assertEquals(lifecycleOwner, lifecycleOwnerArgumentCaptor.getValue());
        assertEquals(observer, observerArgumentCaptor.getValue());
    }

    @Test
    public void testObserveNull(){
        //Arrange
        ProductsViewModel viewModel = new ProductsViewModel(application, null, mockLiveData);

        //Act
        viewModel.observe(null, null);

        //Assert
        verify(mockLiveData).observe(lifecycleOwnerArgumentCaptor.capture(), observerArgumentCaptor.capture());
        assertEquals(null, lifecycleOwnerArgumentCaptor.getValue());
        assertEquals(null, observerArgumentCaptor.getValue());
    }

    @Test
    public void testGetProductsFailure(){
        //Arrange
        String BusinessID = "testBusinessID";
        ProductsViewModel viewModel = new ProductsViewModel(application, mockProductsApiFacade, mockLiveData);

        //Act
        viewModel.getProducts(BusinessID);

        //Assert
        verify(mockProductsApiFacade).getProducts(businessIDArgumentCaptor.capture(),callbackCaptor.capture());
        assertEquals(BusinessID, businessIDArgumentCaptor.getValue());

        //Arrange-Act
        callbackCaptor.getValue().onFailure(null, new Throwable());

        //Assert
        verify(mockLiveData).setValue(null);
    }

    @Test(expected=NullPointerException.class)
    public void testGetProductsNullResponseException(){
        //Arrange
        String BusinessID = "testBusinessID";
        ProductsViewModel viewModel = new ProductsViewModel(application, mockProductsApiFacade, mockLiveData);

        //Act
        viewModel.getProducts(BusinessID);

        //Assert
        verify(mockProductsApiFacade).getProducts(businessIDArgumentCaptor.capture(),callbackCaptor.capture());
        assertEquals(BusinessID, businessIDArgumentCaptor.getValue());

        //Arrange-Act
        callbackCaptor.getValue().onResponse(null, null);
    }

    @Test
    public void testGetProductsSuccess(){
        //Arrange
        String BusinessID = "testBusinessID";
        ProductsViewModel viewModel = new ProductsViewModel(application, mockProductsApiFacade, mockLiveData);

        //Act
        viewModel.getProducts(BusinessID);

        //Assert
        verify(mockProductsApiFacade).getProducts(businessIDArgumentCaptor.capture(),callbackCaptor.capture());
        assertEquals(BusinessID, businessIDArgumentCaptor.getValue());

        //Arrange
        Callback<List<Product>> callback = callbackCaptor.getValue();
        List<Product> products = new ArrayList<>();
        Product product = new Product("TEST", 100);
        products.add(product);

        //Act
        callback.onResponse(null, Response.success(products));

        //Assert
        verify(mockLiveData).setValue(products);
    }

}
