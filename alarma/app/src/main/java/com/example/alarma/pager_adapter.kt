package com.example.alarma

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.lifecycle.Lifecycle
import androidx.viewpager2.adapter.FragmentStateAdapter
import androidx.recyclerview.widget.RecyclerView
import io.github.jan.supabase.createSupabaseClient
import io.github.jan.supabase.postgrest.Postgrest
import io.github.jan.supabase.postgrest.from
import io.github.jan.supabase.postgrest.query.Columns
import io.reactivex.Observable
import kotlinx.serialization.Serializable
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Headers

enum class Feature {
    Tubería, Cuerpo_de_agua, Dren_pluvial, Localidad
}

class pager_adapter (fragmentManager: FragmentManager, lifecycle: Lifecycle) :
    FragmentStateAdapter(fragmentManager, lifecycle) {

    private var fragmentList = ArrayList<Fragment>()
    private var fragmentTitles = ArrayList<String>()
    // Returns the number of fragments
    override fun getItemCount(): Int {
        return fragmentList.size
    }
    // Creates the fragment for the given position
    override fun createFragment(position: Int): Fragment {
        return fragmentList[position]
    }
    // Adds a fragment and its title to the list
    fun addFragment(fragment: Fragment, title: String) {
        fragmentList.add(fragment)
        fragmentTitles.add(title)
    }
    // Retrieves the title of the fragment at the given position
    fun getPageTitle(position: Int): String {
        return fragmentTitles[position]
    }
}

data class Thing (val title: String, val desc: String, val img: Int)

class RecyclerAd (private val mList: List<Thing>) :
    RecyclerView.Adapter<RecyclerAd.ViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.fragment_thing_item, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {

        val th = mList[position]

        // sets the image to the imageview from our itemHolder class
        holder.img.setImageResource(th.img)
        holder.title.text = th.title
        holder.desc.text = th.desc
    }

    // return the number of the items in the list
    override fun getItemCount(): Int {
        return mList.size
    }

    class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var title: TextView
        var img: ImageView
        var desc: TextView
        init {
            title = itemView.findViewById(R.id.thing_title)
            img  = itemView.findViewById(R.id.thing_icon)
            desc = itemView.findViewById(R.id.thing_desc)
        }
    }
}

@Serializable data class Locality(
    val ID_Localidad: Int,
    val Clave: Char,
)

@Serializable data class Well (val ID_Pozo: Int, val Clave: String, val Nombre: String, val Capacidad: Int, val Coords: String)

@Serializable data class Charac (val ID_Localidad: Int, val Tipo: String, val ID_Característica: Int, val Clave_Característica: Char)

class sb {
    val db = createSupabaseClient(
        supabaseUrl = "https://pgvyerkblyuvwuihnajz.supabase.co",
        supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBndnllcmtibHl1dnd1aWhuYWp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMyOTc5ODIsImV4cCI6MjA0ODg3Mzk4Mn0.SX5FNQ5QLljP_Otsl5u5n3-crN8K5dJxlfUj5XcAuAM"
    ) {
        install(Postgrest)
    }

    val retrofit = Retrofit.Builder()
        .baseUrl("https://pgvyerkblyuvwuihnajz.supabase.co")
        .addConverterFactory(GsonConverterFactory.create())
        .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
        .build()
    val wells_api = retrofit.create(hackWells::class.java)

    /*suspend fun listWells(): ArrayList<Thing> {
        val al = ArrayList<Thing>()
        val og = db.from("wells").select(columns = Columns.list("ID_Pozo, Clave, Nombre, Capacidad")).decodeList<Well>()
        for (i in og) {
            al.add(Thing(i.Nombre, "${i.Capacidad} m3 per annum",R.drawable.well))
        }
        return al
    }*/
}

interface hackWells {
    @Headers("apikey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBndnllcmtibHl1dnd1aWhuYWp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMyOTc5ODIsImV4cCI6MjA0ODg3Mzk4Mn0.SX5FNQ5QLljP_Otsl5u5n3-crN8K5dJxlfUj5XcAuAM")
    @GET("rest/v1/wells")
    fun getData(): Observable<List<Well>>
    companion object {
        var retrofitService: hackWells? = null

        fun getInstance() : hackWells {

            if (retrofitService == null) {
                val retrofit = Retrofit.Builder()
                    .baseUrl("https://pgvyerkblyuvwuihnajz.supabase.co")
                    .addConverterFactory(GsonConverterFactory.create())
                    .build()
                retrofitService = retrofit.create(hackWells::class.java)
            }
            return retrofitService!!
        }
    }
}

