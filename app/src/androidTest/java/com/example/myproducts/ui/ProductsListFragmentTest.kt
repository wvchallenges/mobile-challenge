package com.example.myproducts.ui

import androidx.recyclerview.widget.RecyclerView
import androidx.test.espresso.Espresso.onView
import androidx.test.espresso.Espresso.pressBack
import androidx.test.espresso.action.ViewActions.click
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.contrib.RecyclerViewActions
import androidx.test.espresso.matcher.ViewMatchers.*
import androidx.test.ext.junit.rules.ActivityScenarioRule
import com.example.myproducts.MainActivity
import com.example.myproducts.R
import org.junit.Assert.*
import org.junit.Rule
import org.junit.Test

class ProductsListFragmentTest{

    //Launches activity before each test
    @get:Rule
    val mainActivityRule = ActivityScenarioRule(MainActivity::class.java)

    @Test
    fun test_isProductListFragmentDisplayed(){
        onView(withId(R.id.rvProducts)).check(matches(isDisplayed()))
    }




}