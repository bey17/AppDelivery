package com.example.app.providers

import com.example.app.api.ApiRoutes
import com.example.app.models.ResponseHttp
import com.example.app.models.User
import com.example.app.routes.UsersRoutes
import retrofit2.Call

class UsersProvider {
    private var usersRoutes: UsersRoutes? = null

    init{
        val api = ApiRoutes()
        usersRoutes = api.getUsersRoutes()
    }
    fun register(user:User): Call<ResponseHttp>? {
        return usersRoutes?.register(user)
    }
    fun login(email:String, password:String): Call<ResponseHttp>? {
        return usersRoutes?.login(email, password)
    }
}