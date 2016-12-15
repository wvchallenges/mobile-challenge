package com.derekcsm.wave_example.projectlist

class ProjectListPresenter constructor(mView: ProjectListContract.View) :
    ProjectListContract.UserActionsListener {

  private val TAG = "ProjectListPresenter"
  private val mView: ProjectListContract.View

  init {
    this.mView = mView
  }

}