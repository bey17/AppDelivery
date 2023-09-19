package com.example.app.adapters

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.ViewParent
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.example.app.Activities.client.home.ClientHomectivity
import com.example.app.Activities.delivery.home.DeliveryHomeActivity
import com.example.app.Activities.restaurant.home.RestaurantHomeActivity
import com.example.app.R
import com.example.app.models.Rol
import com.example.app.utils.SharedPref
import java.text.FieldPosition
import java.util.ArrayList

class RolesAdapter(val context :Activity, val roles: ArrayList<Rol>): RecyclerView.Adapter<RolesAdapter.RolesViewHolder>() {

    val sharedPref = SharedPref(context)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int):RolesViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.cardview_roles, parent, false)
        return RolesViewHolder(view)
    }

    override fun getItemCount(): Int {
        return roles.size
    }
    override  fun onBindViewHolder(holder: RolesViewHolder, position: Int){
        val rol = roles[position]//cada rol

        holder.textViewRol.text = rol.name
        Glide.with(context) .load(rol.image).into(holder.imageViewRol)

        holder.itemView.setOnClickListener{goToRol(rol)}

    }
    private fun goToRol(rol: Rol){
        if (rol.name == "RESTAURANTE"){
            sharedPref.save("rol", "RESTAURANTE")
            val i = Intent(context, RestaurantHomeActivity::class.java)
            context.startActivity(i)
        }
        else if (rol.name == "CLIENTE"){
            sharedPref.save("rol", "CLIENTE")
            val i = Intent(context, ClientHomectivity::class.java)
            context.startActivity(i)
    }
        else if (rol.name == "REPARTIDOR"){
            sharedPref.save("rol", "REPARTIDOR")
            val i = Intent(context, DeliveryHomeActivity::class.java)
            context.startActivity(i)
        }
        }


        //override fun dummy(parent: ViewGroup, viewType: Int):RolesViewHolder {
        //val view = LayoutInflater.from(parent.context).inflate(R.layout.cardview_roles, parent, false)
    //}

    class RolesViewHolder(view: View):RecyclerView.ViewHolder(view) {
        val textViewRol:TextView
        val imageViewRol: ImageView

        init{
            textViewRol = view.findViewById(R.id.textview_rol)
            imageViewRol = view.findViewById(R.id.imageview_rol)

        }
    }
}