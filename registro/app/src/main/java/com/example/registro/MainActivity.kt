package com.example.registro

import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.EditText
import android.widget.Spinner
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        val editTextName = findViewById<EditText>(R.id.nameText)
        val editTextMail = findViewById<EditText>(R.id.mailText)
        val spinnerOptions = findViewById<Spinner>(R.id.optionSelect)
        val opts = listOf<String>("Leer", "Cocinar", "Escuchar Música")
        val searchButton = findViewById<Button>(R.id.searchClicker)

        val ad = ArrayAdapter(this, android.R.layout.simple_spinner_item, opts)
        spinnerOptions.adapter = ad

        spinnerOptions.onItemSelectedListener = object: AdapterView.OnItemSelectedListener{
            override fun onItemSelected(p0: AdapterView<*>?, p1: View?, position: Int, id: Long) {
                val selecteditem = opts[position]
                if (selecteditem != "Selecciona Opción") Toast.makeText(this@MainActivity, "$selecteditem",
                    Toast.LENGTH_SHORT
                ).show()
            }

            override fun onNothingSelected(p0: AdapterView<*>?) {
                TODO("Not yet implemented")
            }
        }

        searchButton.setOnClickListener {
            val name = editTextName.text.toString()
            val mail = editTextMail.text.toString()
            if (name == "" || mail == "") {
                Toast.makeText(this@MainActivity, "Faltan campos por llenar", Toast.LENGTH_LONG).show()
            } else Toast.makeText(this@MainActivity, "Nombre: $name\nCorreo: $mail", Toast.LENGTH_LONG).show()
        }

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
    }
}