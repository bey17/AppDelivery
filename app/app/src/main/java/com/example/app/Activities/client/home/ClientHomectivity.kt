package com.example.app.Activities.client.home

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import com.example.app.Activities.MainActivity
import com.example.app.R
import com.example.app.models.User
import com.example.app.utils.SharedPref
import com.google.gson.Gson

class ClientHomectivity : AppCompatActivity() {

    private val TAG = "ClientHomectivity"
    var buttonLogout:Button? = null
    var sharedPref: SharedPref? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_client_homectivity)

        sharedPref = SharedPref(this)

        buttonLogout = findViewById(R.id.btn_logout)
        buttonLogout?.setOnClickListener{logout()}


        getUserFromSession()

    }

    private fun logout(){
        sharedPref?.remove("user")
        val i = Intent(this, MainActivity::class.java)
        startActivity(i)
    }

    private fun getUserFromSession(){
       // val sharedPref = SharedPref(this)
        val gson = Gson()

        if(!sharedPref?.getData("user").isNullOrBlank()){
            //si el usario existe en sesion
            val user = gson.fromJson(sharedPref?.getData("user"),User::class.java)
            Log.d(TAG,"Usuario: $user")
        }
    }

}