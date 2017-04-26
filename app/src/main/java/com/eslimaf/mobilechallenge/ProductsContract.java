package com.eslimaf.mobilechallenge;

public interface ProductsContract {
    interface Presenter {
        void getProducts();
    }

    interface View {
        void showProduct();
    }
}
