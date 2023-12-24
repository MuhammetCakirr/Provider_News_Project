import 'package:countryproject/features/DetailPage/detailpage_view.dart';
import 'package:countryproject/features/FavoritesPage/favoritespage_view.dart';
import 'package:countryproject/features/HomePage/homepage_viewmodel.dart';
import 'package:countryproject/features/model/News_model.dart';
import 'package:countryproject/product/page_padding.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final  HomePageViewModel _homePageViewModel;
  @override
  void initState() {
    super.initState();
     _homePageViewModel=HomePageViewModel();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _homePageViewModel,
      builder:((context, child) {
        return Scaffold(
        appBar: AppBar(
          title:const Text("Provider-MVVM"),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritePage(homePageViewModel:_homePageViewModel ),
              ),
            );
            }, 
            icon: const Icon(Icons.favorite_border_sharp),color: Colors.red,)
          ],
        ),
        body:Padding(
          padding: PagePadding.high(),
          child: GridViewBuilderMethod(_homePageViewModel),
        ) ,
      );
      }) 
    );
  }

  Widget GridViewBuilderMethod(HomePageViewModel homePageViewModel) {
  return context.watch<HomePageViewModel>().results.isEmpty? 
  GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Bir satırda iki eleman
      crossAxisSpacing: 8.0, // Yatayda elemanlar arası boşluk
      mainAxisSpacing: 8.0, // Dikeyde elemanlar arası boşluk
    ) ,
    itemCount: 7,
     itemBuilder: (context,index){
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.2,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius: const BorderRadius.all(Radius.circular(16))
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height*0.02,
            
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.04),
              borderRadius: const BorderRadius.all(Radius.circular(16))
            ),
          ),
        ),
      ],
    );
    })
  :
     GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Bir satırda iki eleman
      crossAxisSpacing: 8.0, // Yatayda elemanlar arası boşluk
      mainAxisSpacing: 8.0, // Dikeyde elemanlar arası boşluk
    ),
    itemCount: context.read<HomePageViewModel>().results.length,
    itemBuilder: (context, index) {
       Result result=context.read<HomePageViewModel>().results[index];
       
      return GestureDetector(
      onTap: (){ 
        Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(result: result),
              ),
            );
      },
      child: Card(
        child: Stack(
          children: [            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.network(
                    result.image!,
                    height: 90.0,
                    width: 100.0,
                  ),
                ),
                Text(
                  result.name!,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Positioned(
              top: 1.0,
              right:1.0,
              child: IconButton(
                icon: Icon(Icons.favorite_border,color: context.watch<HomePageViewModel>().favoritelist.contains(result)==true? Colors.red:Colors.black ),
                onPressed: () {
                  homePageViewModel.AddfavoriteList(result);
                 
                },
              ),
            ),
          ],
        ),
      ),
    );
    },
  );
  }
  
   
}




