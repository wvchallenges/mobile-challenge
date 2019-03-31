package android.sample.wavechallenge.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider

fun <T : ViewModel, A> singleArgViewModelFactory(constructor: (A) -> T):
            (A) -> ViewModelProvider.NewInstanceFactory {
    return { arg: A ->
        object : ViewModelProvider.NewInstanceFactory() {
            @Suppress("UNCHECKED_CAST")
            override fun <V : ViewModel> create(modelClass: Class<V>): V {
                return constructor(arg) as V
            }
        }
    }
}

fun <T : ViewModel, A, B> doubleArgViewModelFactory(constructor: (A, B) -> T):
            (A, B) -> ViewModelProvider.NewInstanceFactory {
    return { arg: A, arg2: B ->
        object : ViewModelProvider.NewInstanceFactory() {
            @Suppress("UNCHECKED_CAST")
            override fun <V : ViewModel> create(modelClass: Class<V>): V {
                return constructor(arg, arg2) as V
            }
        }
    }
}