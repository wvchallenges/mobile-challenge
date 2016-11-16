package me.jimmydieng.wavechallenge.products;


import java.util.List;

import me.jimmydieng.wavechallenge.BasePresenter;
import me.jimmydieng.wavechallenge.BaseView;
import me.jimmydieng.wavechallenge.data.Business;
import me.jimmydieng.wavechallenge.data.Product;

public interface ProductContract {
  interface View extends BaseView<Presenter> {
    void showProducts(List<Product> products);

    void showEmpty();
  }

  interface Presenter extends BasePresenter {
    void unbind();

    void setBusiness(Business business);
  }
}
