package com.alihn.waveapp.main.ui

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.Toolbar

import com.alihn.waveapp.R

/**
 * Created by 0xAliHn
 */

class ProductListingActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setToolbar()
    }

    private fun setToolbar() {
        val toolbar = findViewById<Toolbar>(R.id.toolbar)
        setSupportActionBar(toolbar)

        supportActionBar?.setTitle(R.string.waveapp_product)
        supportActionBar?.setDisplayShowTitleEnabled(true)
    }

}
