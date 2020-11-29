import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'http_exception.dart';

class Authonication with ChangeNotifier{ 
Future<void> signUp(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyANFTk9r8Un5VR5Xv1f6S3_N7opeC5-Zt8';
   
   try
   {
        final response =  await http.post(url, body: json.encode(
      {     
        'email' : email,
        'password' : password,
        'returnSecureToken' : true,
      }
    ));

    final responeData = json.decode(response.body);
     if(responeData['error'] != null)
    {
      throw HttpException(responeData['error']['message']);
    }
   // print(responeData);
   }
   catch(error)
   {
     throw error;
   }
   

  }

  //login
  Future<void> logIn(String email, String password) async
  {
  const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyANFTk9r8Un5VR5Xv1f6S3_N7opeC5-Zt8';

  try{
      final response =  await http.post(url, body: json.encode(
      {     
        'email' : email,
        'password' : password,
        'returnSecureToken' : true,
      }
    ));

    final responeData = json.decode(response.body);
    if(responeData['error'] != null)
    {
      throw HttpException(responeData['error']['message']);
    }
  //  print(responeData);

  }catch(error){
    throw error;
  }


  }

  

}