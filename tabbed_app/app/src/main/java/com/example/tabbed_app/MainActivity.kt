package com.example.tabbed_app

import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.Adapter
import androidx.viewpager2.widget.ViewPager2
import com.example.menu.ViewPagerAdapter
import com.google.android.material.tabs.TabLayout
import com.google.android.material.tabs.TabLayoutMediator

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
        val viewpager = findViewById<ViewPager2>(R.id.pager)
        val adapter = ViewPagerAdapter(supportFragmentManager, lifecycle)
        val tabLayout = findViewById<TabLayout>(R.id.tabs)
        // Adding fragments to the adapter
        adapter.addFragment(First(), "1st")
        adapter.addFragment(Second(), "2nd")
        adapter.addFragment(Third(), "3rd")
        adapter.notifyDataSetChanged()

        viewpager.adapter = adapter

        // Linking the TabLayout and the ViewPager2
        TabLayoutMediator(tabLayout, viewpager) { tab, position ->
            tab.text = adapter.getPageTitle(position)
            viewpager.setCurrentItem(tab.position, true)
        }.attach()
    }
}