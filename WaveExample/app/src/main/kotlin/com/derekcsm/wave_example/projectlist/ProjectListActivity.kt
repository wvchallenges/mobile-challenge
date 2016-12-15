package com.derekcsm.wave_example.projectlist

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.RecyclerView
import butterknife.bindView
import com.derekcsm.wave_example.R

class ProjectListActivity : AppCompatActivity(), ProjectListContract.View {

  private val TAG = "ProjectListActivity"
  private lateinit var mActionsListener: ProjectListContract.UserActionsListener

  val rvProjectList: RecyclerView by bindView(R.id.rv_project_list)

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.act_project_list)

    mActionsListener = ProjectListPresenter(this)

    mActionsListener.fetchProductsFromApi()
  }
}
