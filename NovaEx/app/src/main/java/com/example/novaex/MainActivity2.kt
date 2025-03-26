package com.example.novaex

import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Spinner
import android.widget.TextView
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import com.google.android.material.snackbar.Snackbar
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.navigation.findNavController
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.navigateUp
import androidx.navigation.ui.setupActionBarWithNavController
import com.example.novaex.databinding.ActivityMain2Binding

class MainActivity2 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main2)

        val bundle = intent.extras
        val rnd = bundle?.getInt("rnd")
        val nam = bundle?.getString("name")

        val stars = listOf<String>("Dubhe",
            "Merak",
            "Phecda",
            "Megrez",
            "Alioth",
            "Mizar",
            "Alkaid")

        val spn = findViewById<Spinner>(R.id.starSelect)

        findViewById<TextView>(R.id.starNumber).setText(rnd.toString())

        Toast.makeText(this, "$nam consiguió $rnd estrella(s)!", Toast.LENGTH_LONG).show()

        spn.adapter = ArrayAdapter(this, android.R.layout.simple_spinner_item, stars)
        spn.onItemSelectedListener = object: AdapterView.OnItemSelectedListener{
            override fun onItemSelected(p0: AdapterView<*>?, p1: View?, position: Int, id: Long) {
                val selecteditem = stars[position]
                if (selecteditem != "Selecciona Opción") Toast.makeText(this@MainActivity2, "$selecteditem",
                    Toast.LENGTH_SHORT
                ).show()
            }

            override fun onNothingSelected(p0: AdapterView<*>?) {
                TODO("Not yet implemented")
            }
        }

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
    }
}