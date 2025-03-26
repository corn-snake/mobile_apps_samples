package com.example.progress

import android.os.Bundle
import android.os.Handler
import android.view.View
import android.widget.ImageView
import android.widget.ProgressBar
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.os.postDelayed
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        val progTxt = findViewById<TextView>(R.id.progTxt)
        val prog = findViewById<ProgressBar>(R.id.prog)
        val handler = Handler()
        var i = 0
        handler.postDelayed(object: Runnable {
            override fun run() {
                if (i<=100) {
                    progTxt.setText(i.toString())
                    prog.setProgress(i)
                    i++
                    handler.postDelayed(this, 200)
                } else {
                    prog.visibility = View.GONE
                    progTxt.visibility = View.GONE
                    findViewById<ImageView>(R.id.img).visibility = View.VISIBLE
                    handler.removeCallbacks(this)
                }
            }
        }, 200)

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
    }
}