package com.example.myapplication

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.myapplication.ui.theme.MyApplicationTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            MyApplicationTheme {
                Scaffold(modifier = Modifier
                    .fillMaxSize()
                    .padding(16.dp)) { innerPadding ->
                    Column {
                        TextoNombre(
                            name = "corn-snake",
                            modifier = Modifier.padding(innerPadding)
                        )
                        Row {
                            TextoDescripcion(content = "Ceci n'est pas un Chien")
                            ImagenGeneral();
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun TextoNombre(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Soy $name, esta es una app para la clase Diseño de Apps",
        modifier = modifier
    )
}

@Composable
fun TextoDescripcion(content: String, modifier: Modifier = Modifier) {
    Text(
        text = "$content",
        modifier = modifier.background(color = Color.Green)
    )
}

@Composable
fun ImagenGeneral() {
    val ptr = painterResource(id = R.drawable.dorg)
    Box {
        Image (painter = ptr, contentDescription = null)
    }
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    MyApplicationTheme {
        TextoNombre("Android")
    }
}