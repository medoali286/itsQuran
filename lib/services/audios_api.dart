import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class GetAudios{


  Future<List<dynamic>>getData({ @required String pageNumber, @required String perPage, @required String author})async{

    Uri url=Uri.parse("https://cloudelib.midadedev.com/api/api-json/items/all/audios?page_number=$pageNumber&per_page=$perPage&author=$author&sort=title");
    print(url);
    http.Response res=await http.get(url);

    // print(res.body.toString());
    Map jsonDecoder=jsonDecode(res.body);

    List list=jsonDecoder["data"];
    // print(list);

    return list;




  }



}
