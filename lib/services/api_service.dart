import 'dart:convert';

import 'package:sample2/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<List<UserModel>> getAllUser () async{
    String endpoint = 'https://reqres.in/api/users?page=2';

    List<UserModel> userList = [];

     try {

       http.Response response = await http.get(Uri.parse(endpoint));


       if(response.statusCode == 200) {

         List<dynamic> jsonData = jsonDecode(response.body)['data'];

         for (var element in jsonData) {
           userList.add(UserModel.fromJson(element));
         }

         return userList;
       } else {
         return [];
       }


     } catch (e){
       throw Exception(e.toString());
     }
  }

}