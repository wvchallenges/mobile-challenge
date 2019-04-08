package com.karlptrck.wavechallenge.db

import androidx.paging.DataSource
import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.karlptrck.wavechallenge.model.Product

@Dao
interface ProductDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insert(products : List<Product>)

    @Query("SELECT * FROM products ORDER BY id ASC")
    fun getProducts() : DataSource.Factory<Int, Product>

}