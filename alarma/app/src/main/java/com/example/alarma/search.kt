package com.example.alarma

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.LinearLayoutManager
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import okhttp3.internal.notify

// TODO: Rename parameter arguments, choose names that match
// the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
private const val ARG_PARAM1 = "param1"
private const val ARG_PARAM2 = "param2"

/**
 * A simple [Fragment] subclass.
 * Use the [search.newInstance] factory method to
 * create an instance of this fragment.
 */
class search : Fragment() {
    // TODO: Rename and change types of parameters
    private var param1: String? = null
    private var param2: String? = null

    private lateinit var itemList: List<Thing>
    // private var viewPool : RecyclerView.RecycledViewPool = RecyclerView.RecycledViewPool()
    private var linearLayoutManager: LinearLayoutManager? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            param1 = it.getString(ARG_PARAM1)
            param2 = it.getString(ARG_PARAM2)
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val ly = inflater.inflate(R.layout.fragment_search, container, false)
        val db = sb()
        /*val data = ArrayList<Thing>()
        for (i in 1..12) {
            data.add(Thing("Feature $i","Feature #$i",R.drawable.unknown_blu))
        }*/

        val rec = ly.findViewById<RecyclerView>(R.id.rec)
        rec.setHasFixedSize(true)
        linearLayoutManager = LinearLayoutManager(activity, RecyclerView.VERTICAL, false)
        rec.layoutManager = linearLayoutManager

            db.wells_api.getData()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe({ dataList ->
                    Toast.makeText(activity, "Fetched ${dataList.size} items.", Toast.LENGTH_LONG).show()
                    rec.adapter = RecyclerAd(dataList.map {
                        Thing(it.Nombre, "${it.Capacidad} m3 per annum",R.drawable.well_png)
                    })
                }, { error ->
                    Log.e("MyApp", "Error fetching data", error)
                })
        //rec.adapter = RecyclerAd(data)
        return ly
    }
    
    override fun onViewCreated(view: View, savedInsanceState: Bundle?) {
        super.onViewCreated(view, savedInsanceState)
        /*

        layoutManager = LinearLayoutManager(activity)
        adapter = RecyclerAd(data)
        rec.apply {
        }*/
    }

    companion object {
        /**
         * Use this factory method to create a new instance of
         * this fragment using the provided parameters.
         *
         * @param param1 Parameter 1.
         * @param param2 Parameter 2.
         * @return A new instance of fragment search.
         */
        // TODO: Rename and change types and number of parameters
        @JvmStatic
        fun newInstance(param1: String, param2: String) =
            search().apply {
                arguments = Bundle().apply {
                    putString(ARG_PARAM1, param1)
                    putString(ARG_PARAM2, param2)
                }
            }
    }
}