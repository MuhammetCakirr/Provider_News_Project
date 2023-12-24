

import 'package:countryproject/features/model/News_model.dart';
import 'package:countryproject/service/news_service.dart';
import 'package:flutter/material.dart';

class HomePageViewModel with ChangeNotifier{

  // BuildContext context;
   HomePageViewModel()
   {
    Getresults();
   }
  
  // ignore: unused_field
  final NewsService _NewsService=NewsService();
  List<Result> _results=[];
  List<Result> _favoritelist=[];
  List<Result> get results=>_results;
  List<Result> get favoritelist=>_favoritelist;

  
  void AddfavoriteList(Result News) 
  {
    if(_favoritelist.contains(News))
    {
      _favoritelist.remove(News);
    }
    else{
      _favoritelist.add(News);
    }
    notifyListeners();
  }

  Future<void> Getresults () async
  {
    print("HomePageViewModel Getresults Çalışıyor");
   _results=await _NewsService.fetchNews();
   notifyListeners();
  }

}