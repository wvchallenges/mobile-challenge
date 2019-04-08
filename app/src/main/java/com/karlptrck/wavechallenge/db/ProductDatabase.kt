package com.karlptrck.wavechallenge.db

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import com.karlptrck.wavechallenge.model.Product


@Database(
    entities = [Product::class],
    version = 1,
    exportSchema = false
)

abstract class ProductDatabase : RoomDatabase(){

    abstract fun productsDao() : ProductDao


    companion object {

        @Volatile
        private var INSTANCE : ProductDatabase? = null

        fun getInstance(context : Context) : ProductDatabase = INSTANCE ?: synchronized(this){
            INSTANCE ?: buildDatabase(context).also { INSTANCE = it }
        }

        private fun buildDatabase(context: Context) =
            Room.databaseBuilder(context.applicationContext,
                ProductDatabase::class.java, "Wave.db")
                .build()
    }

}