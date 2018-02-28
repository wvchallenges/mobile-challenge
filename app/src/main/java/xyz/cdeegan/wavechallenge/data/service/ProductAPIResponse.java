package xyz.cdeegan.wavechallenge.data.service;

import java.util.List;

import xyz.cdeegan.wavechallenge.data.entity.Product;

public class ProductAPIResponse
{
	private List<Product> products;
	private Throwable error;

	public ProductAPIResponse(List<Product> products)
	{
		this.products = products;
		this.error = null;
	}

	public ProductAPIResponse(Throwable error)
	{
		this.products = null;
		this.error = error;
	}

	public List<Product> getProducts()
	{
		return products;
	}

	public Throwable getError()
	{
		return error;
	}
}
