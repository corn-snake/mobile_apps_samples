package com.example.cafeteria

import android.os.Bundle
import android.view.View
import android.view.View.VISIBLE
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Spinner
import android.widget.TextView
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import kotlin.reflect.typeOf

class MainActivity2 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main2)
        val bundle = intent.extras
        val cli = bundle?.getString("cli")
        val att = bundle?.getString("att")
        val itAmount = bundle?.getString("amount")
        val items = listOf<TextView>(findViewById<TextView>(R.id.it1Text),
            findViewById<TextView>(R.id.it2Text),
            findViewById<TextView>(R.id.it3Text),
            findViewById<TextView>(R.id.it4Text),
            findViewById<TextView>(R.id.it5Text))
        var it = 1;

        findViewById<TextView>(R.id.clientName).text = cli
        findViewById<TextView>(R.id.attName).text = att

        while (it <= (if (itAmount != null) itAmount else "0").toInt()) {
            items[it-1].visibility = VISIBLE
            items[it-1].text = bundle?.getString("item${it}")
            it++
        }

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
    }
}