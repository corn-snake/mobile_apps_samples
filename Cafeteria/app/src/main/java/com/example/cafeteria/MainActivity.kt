package com.example.cafeteria

import android.content.Intent
import android.os.Bundle
import android.view.View.GONE
import android.view.View.VISIBLE
import android.widget.Adapter
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.EditText
import android.widget.Spinner
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.google.android.material.slider.Slider

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        val itemAmount = findViewById<Slider>(R.id.ordAmm)
        val items = listOf<Spinner>(findViewById<Spinner>(R.id.firstItem),
            findViewById<Spinner>(R.id.secondItem),
            findViewById<Spinner>(R.id.thirdItem),
            findViewById<Spinner>(R.id.fourthItem),
            findViewById<Spinner>(R.id.fifthItem))
        val attName = findViewById<EditText>(R.id.attName)
        val cliName = findViewById<EditText>(R.id.clName)
        val clicker = findViewById<Button>(R.id.finalShowdown)

        val productos = listOf<String>("Cafe", "Te", "Frappe")
        val ad = ArrayAdapter(this, android.R.layout.simple_spinner_item, productos)
        items.forEach {
            it.adapter = ad
        }

        itemAmount.addOnChangeListener(object: Slider.OnChangeListener {
            override fun onValueChange(slider: Slider, value: Float, fromUser: Boolean) {
                var i = 0;
                items.forEach {
                    if (i > value.toInt())
                        it.visibility = GONE
                    else
                        it.visibility = VISIBLE
                    i++;
                }
            }
        })

        clicker.setOnClickListener {
            val intent = Intent(this, MainActivity2::class.java)
            intent.putExtra("att", attName.text.toString())
            intent.putExtra("cli", cliName.text.toString())
            intent.putExtra("amount", itemAmount.value.toString())
            var i = 0;
            items.forEach {
                intent.putExtra("item${i+1}", it.getSelectedItem().toString())
                i++;
            }
            startActivity(intent)
        }

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
    }
}