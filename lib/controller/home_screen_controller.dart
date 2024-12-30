import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';


import 'package:flutter_newsapp/model/searchNews.dart';
import 'package:flutter_newsapp/view/appconfigure.dart';
import 'package:http/http.dart' as http;


class HomeScreenController with ChangeNotifier {
  List <Article> alltopnews= [];
  SearchNews?selectednewses;

   
 
  Future<void> getallnews() async {
    final url = Uri.parse(Appconfigure.baseurl +
          'everything?q=sports&apiKey=90d22930750445fd821cef472d409c0a');
    try {
      
      final response = await http.get(url);
       if (response.statusCode == 200) {
         final allnews = SearchNews.fromJson(jsonDecode(response.body));
        alltopnews = allnews.articles??[];
        log(response.body.toString());
        
      }
    } catch (e) {}notifyListeners();
  }

// Future<void>getselcetednewss()async{
//   final url=Uri.parse(Appconfigure.baseurl+'top-headlines/sources?category=sports&apiKey=90d22930750445fd821cef472d409c0a');
//   try{
//   final  response=await http.get(url);
//   if(response.statusCode==200){selectednewses=SearchNews.fromJson(response.)}
//   }catch(e){

// }
// }

  
}
