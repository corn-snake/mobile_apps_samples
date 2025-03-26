package com.example.navegacion

import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Spinner
import android.widget.TextView
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity2 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main2)
        val bundle = intent.extras
        val nom = bundle?.getString("nombre")
        val nom2 = findViewById<TextView>(R.id.nombre2)
        val ap = bundle?.getString("apellido")
        val ap2 = findViewById<TextView>(R.id.apellido2)
        val gs = listOf<String?>(bundle?.getString("g1"),bundle?.getString("g2"),bundle?.getString("g3"))
        val gsAd = ArrayAdapter(this, android.R.layout.simple_spinner_item, gs)
        val gs2 = findViewById<Spinner>(R.id.gustos)
        gs2.adapter = gsAd
        nom2.setText("Nombre(s): $nom")
        ap2.setText("Apellido(s): $ap")
        Toast.makeText(this, "Hi & Welcome, $nom", Toast.LENGTH_LONG).show()
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
    }
}