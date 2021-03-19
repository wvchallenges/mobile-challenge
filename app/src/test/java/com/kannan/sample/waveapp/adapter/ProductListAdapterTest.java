package com.kannan.sample.waveapp.adapter;

import android.app.Activity;

import com.kannan.sample.waveapp.BuildConfig;
import com.kannan.sample.waveapp.model.Product;
import com.kannan.sample.waveapp.view.adapter.ProductsListAdapter;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.MockitoAnnotations;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLog;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(RobolectricTestRunner.class)
@Config(constants = BuildConfig.class, sdk = 23, manifest = Config.NONE)
public class ProductListAdapterTest {
    Activity activity;

    @Before
    public void setUp() {
        ShadowLog.stream = System.out;
        MockitoAnnotations.initMocks(this);
        activity = Robolectric.buildActivity(Activity.class).create().start().resume().get();

    }

    @Test
    public void testSetItems(){
        //Arrange
        List<Product> products = new ArrayList<>();
        Product product1 = new Product("TEST1", 100);
        Product product2 = new Product("TEST2", 200);
        Product product3 = new Product("TEST3", 300);
        products.add(product1);
        products.add(product2);
        products.add(product3);
        ProductsListAdapter productsListAdapter = new ProductsListAdapter(activity);

        //Act
        productsListAdapter.setItems(products);

        //Assert
        assertEquals(products.size(), productsListAdapter.getItemCount());
    }

    @Test
    public void testSetItemsNull(){
        //Arrange
        ProductsListAdapter productsListAdapter = new ProductsListAdapter(activity);

        //Act
        productsListAdapter.setItems(null);

        //Assert
        assertEquals(0, productsListAdapter.getItemCount());
    }

    @Test
    public void testSetItemsEmpty(){
        //Arrange
        List<Product> products = new ArrayList<>();
        products.clear();
        ProductsListAdapter productsListAdapter = new ProductsListAdapter(activity);

        //Act
        productsListAdapter.setItems(products);

        //Assert
        assertEquals(0, productsListAdapter.getItemCount());
    }
}
