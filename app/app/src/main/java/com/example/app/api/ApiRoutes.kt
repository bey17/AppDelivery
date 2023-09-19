package com.example.app.api

import com.example.app.routes.UsersRoutes

class ApiRoutes {

    val API_URL = "http://192.168.100.3:3000/api/"
    val retrofit = RetrofitClient()

    fun getUsersRoutes(): UsersRoutes{
        return retrofit.getClient(API_URL).create(UsersRoutes:: class.java)
    }
}