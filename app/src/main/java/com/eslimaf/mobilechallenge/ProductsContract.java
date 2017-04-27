package com.eslimaf.mobilechallenge;

import com.eslimaf.mobilechallenge.model.Product;

import java.util.List;

public interface ProductsContract {
    interface Presenter {
        void attachView(View view);
        void detachView();
        void getProducts();
    }

    interface View {
        void showProducts(List<Product> products);
        void showProgress();
        void hideProgress();
        void showErrorDialog();
    }
}
