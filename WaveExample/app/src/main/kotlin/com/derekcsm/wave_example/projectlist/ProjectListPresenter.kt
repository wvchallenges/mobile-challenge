package com.derekcsm.wave_example.projectlist

import android.util.Log

class ProjectListPresenter constructor(mView: ProjectListContract.View) :
    ProjectListContract.UserActionsListener {

  private val TAG = "ProjectListPresenter"
  private val mView: ProjectListContract.View

  init {
    this.mView = mView
  }

  override fun test() {
    Log.d(TAG, "test")
  }
}