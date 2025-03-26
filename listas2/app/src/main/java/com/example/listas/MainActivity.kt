package com.example.listas

import android.os.Bundle
import android.widget.ArrayAdapter
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.example.listas.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    private var lis = emptyArray<String>()
    lateinit var adapt: ArrayAdapter<*>
    private lateinit var bind: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        bind = ActivityMainBinding.inflate(layoutInflater)
        setContentView(bind.root)

        var lis=arrayOf(
            "Principios de IoT",
            "Diseño de Apps",
            "Aplicaciones Web Orientadas a Servicios",
            "Estructuras de Datos",
            "Evaluación y Mejora de Desarrollo de Software",
            "Estándares y Métricas de Desarrollo de Software",
            "Formación Sociocultural IV",
            "Inglés"
        )

        var itemAdapter= ArrayAdapter<String>(MainActivity@this,android.R.layout.simple_list_item_1,lis)
        bind.lis.adapter = itemAdapter

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
    }
}