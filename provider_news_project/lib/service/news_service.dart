


import 'dart:convert';
import 'dart:developer';

import 'package:countryproject/features/model/News_model.dart';
import 'package:dio/dio.dart';

class NewsService{
  final Dio _dio = Dio();
   final String apiUrl = 'https://api.collectapi.com/news/getNews?country=tr&tag=general';
  final String apiKey = 'apikey 3PLbUK6FDmvOlwDAZWc62q:1QgkCyiW7T7Rx8yUiP4z8o'; 
  List<Result> _news=[];
  Future<List<Result>> fetchNews() async {
      try {
        Response response = await _dio.get(
      apiUrl,
      options: Options(
        headers: {
          'authorization': '$apiKey',
          'content-type': 'application/json',
        },
      ),
    );

        if (response.statusCode == 200) {

          // Başarılı yanıt alındı, işlemleri burada yapabilirsiniz.
          print('Data fetched successfully');
          log(response.data.toString());
           Map<String, dynamic> jsonData = json.decode(response.toString());
      
          _news= News.fromJson(jsonData).result ?? [];
           print(_news.length.toString());
          return _news;
        } else {
          // Başarısız yanıt alındı, durum kodunu kontrol edebilir ve uygun şekilde işlem yapabilirsiniz.
          print('Error fetching data. Status Code: ${response.statusCode}');
          return _news;
        }
      } catch (error) {
        // İstek sırasında bir hata oluştu.
        print('Error fetching data: $error');
        return _news;
      }
    }
}