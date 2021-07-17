
import 'package:flutter/cupertino.dart';



class HomeProvider extends ChangeNotifier {

  String videosPerPage="10";
  String audiosPrePage="10";
  String booksPrePage="10";
 String articlesPerPage="10";

  seeAll({@required String type}){


    switch(type){
      case "videos":{
        videosPerPage="30";
        notifyListeners();
      }break;
      case "audios":{
        audiosPrePage="30";
        notifyListeners();
      }break;
      case "books":{
        booksPrePage="30";
        notifyListeners();
      }break;
      case "articles":{
        articlesPerPage="30";
        notifyListeners();
      }break;
      default :{

      }


    }


  }










}

