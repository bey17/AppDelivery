package com.example.app.routes

import com.example.app.models.ResponseHttp
import com.example.app.models.User
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.POST

interface UsersRoutes {
    @POST("users/create")
    fun register(@Body user: User): Call<ResponseHttp>

    @FormUrlEncoded
    @POST("users/login")
    fun login(@Field("email")email: String, @Field("password")password: String): Call<ResponseHttp>
}