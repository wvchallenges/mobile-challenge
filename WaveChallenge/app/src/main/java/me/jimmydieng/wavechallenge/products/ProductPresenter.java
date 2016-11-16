package me.jimmydieng.wavechallenge.products;


import java.util.List;

import me.jimmydieng.wavechallenge.data.Business;
import me.jimmydieng.wavechallenge.data.Product;

public class ProductPresenter implements ProductContract.Presenter, ProductModel.Listener {
  private ProductContract.View view;
  private ProductModel model;
  private Business business;

  public ProductPresenter(ProductContract.View view, ProductModel model) {
    this.view = view;
    this.model = model;
  }

  @Override
  public void start() {
    if (business != null) {
      model.getProducts(business, this);
    }
  }

  @Override
  public void unbind() {
    view = null;
  }

  @Override
  public void setBusiness(Business business) {
    this.business = business;
  }

  @Override
  public void onSuccess(List<Product> products) {
    view.showProducts(products);
  }

  @Override
  public void onFailure() {
    view.showEmpty();
  }
}
