package com.example.menu

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.lifecycle.Lifecycle
import androidx.viewpager2.adapter.FragmentStateAdapter
class ViewPagerAdapter(fragmentManager: FragmentManager, lifecycle: Lifecycle) :
    FragmentStateAdapter(fragmentManager, lifecycle) {
    private var fragmentList = ArrayList<Fragment>()
    private var fragmentTitles = ArrayList<String>()
    // Returns the number of fragments
    override fun getItemCount(): Int {
        return fragmentList.size
    }
    // Creates the fragment for the given position
    override fun createFragment(position: Int): Fragment {
        return fragmentList[position]
    }
    // Adds a fragment and its title to the list
    fun addFragment(fragment: Fragment, title: String) {
        fragmentList.add(fragment)
        fragmentTitles.add(title)
    }
    // Retrieves the title of the fragment at the given position
    fun getPageTitle(position: Int): String {
        return fragmentTitles[position]
    }
}