package com.alihn.waveapp.util

import android.content.Context
import android.net.ConnectivityManager

/**
 * Created by 0xAliHn
 */

internal class NetworkChecker {
    companion object{
        fun isNetworkAvailable(_context: Context?): Boolean {
            val connectivityManager = _context?.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            val activeNetworkInfo = connectivityManager.activeNetworkInfo
            return activeNetworkInfo != null && activeNetworkInfo.isConnected
        }
    }
}