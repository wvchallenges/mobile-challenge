package com.derekcsm.wave_example.projectlist

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import com.derekcsm.wave_example.R

class ProjectListActivity : AppCompatActivity(), ProjectListContract.View {

  private lateinit var mActionsListener: ProjectListContract.UserActionsListener

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.act_project_list)

    mActionsListener = ProjectListPresenter(this)
    mActionsListener.test()
  }
}
