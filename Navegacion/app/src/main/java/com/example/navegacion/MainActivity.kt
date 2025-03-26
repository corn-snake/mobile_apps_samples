package com.example.navegacion

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        val sig = findViewById<Button>(R.id.siguiente)
        val nom = findViewById<EditText>(R.id.name)
        val ap = findViewById<EditText>(R.id.apellido)
        val g1 = findViewById<EditText>(R.id.gustos1)
        val g2 = findViewById<EditText>(R.id.gustos2)
        val g3 = findViewById<EditText>(R.id.gustos3)

        sig.setOnClickListener{
            val intent = Intent(this, MainActivity2::class.java)
            intent.putExtra("nombre",nom.text.toString())
            intent.putExtra("apellido",ap.text.toString())
            intent.putExtra("g1",g1.text.toString())
            intent.putExtra("g2",g2.text.toString())
            intent.putExtra("g3",g3.text.toString())
            startActivity(intent)
        }

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
    }
}