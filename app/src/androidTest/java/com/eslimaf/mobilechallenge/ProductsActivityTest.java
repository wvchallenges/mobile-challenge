package com.eslimaf.mobilechallenge;

import android.support.test.espresso.Espresso;
import android.support.test.espresso.IdlingResource;
import android.support.test.filters.LargeTest;
import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;
import android.view.View;
import android.widget.AdapterView;

import org.hamcrest.Description;
import org.hamcrest.TypeSafeMatcher;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withId;

@RunWith(AndroidJUnit4.class)
@LargeTest
public class ProductsActivityTest {
    //This value would be constant and known in a test server
    private final int mProductListSizeFixture = 7;
    private LoadingDialogIdlingResource mIdlingResource;

    @Rule
    public final ActivityTestRule<ProductsActivity> mActivityTestRule
            = new ActivityTestRule<>(ProductsActivity.class);

    @Before
    public void init() {
        mIdlingResource = new LoadingDialogIdlingResource(mActivityTestRule.getActivity());
        Espresso.registerIdlingResources(mIdlingResource);
    }

    @After
    public void unregisterIdlingResource(){
        Espresso.unregisterIdlingResources(mIdlingResource);
    }

    @Test
    public void testProductListViewIsPresent() {
        onView(withId(R.id.products_list)).check(matches(isDisplayed()));
    }

    @Test
    public void testRetrieveProducts() throws Exception {
        onView(withId(R.id.products_list)).check(matches(new TypeSafeMatcher<View>() {
            int length;

            @Override
            protected boolean matchesSafely(View item) {
                length = ((AdapterView) item).getAdapter().getCount();
                return length == mProductListSizeFixture;
            }

            @Override
            public void describeTo(Description description) {
                description.appendText("Product list should have " + mProductListSizeFixture
                        + "items, but only has " + length);
            }
        }));
    }

    public class LoadingDialogIdlingResource implements IdlingResource {
        private ResourceCallback mResourceCallback;
        private ProductsActivity mActivity;

        LoadingDialogIdlingResource(ProductsActivity activity) {
            mActivity = activity;
        }

        @Override
        public String getName() {
            return LoadingDialogIdlingResource.class.getName();
        }

        @Override
        public boolean isIdleNow() {
            boolean idle = isIdle();
            if (idle) {
                mResourceCallback.onTransitionToIdle();
            }
            return idle;
        }

        private boolean isIdle() {
            return mActivity != null && !mActivity.isLoading();
        }

        @Override
        public void registerIdleTransitionCallback(ResourceCallback callback) {
            mResourceCallback = callback;
        }
    }
}