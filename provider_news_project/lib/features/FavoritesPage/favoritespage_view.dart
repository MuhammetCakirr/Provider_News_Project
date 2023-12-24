import 'package:countryproject/features/DetailPage/detailpage_view.dart';
import 'package:countryproject/features/HomePage/homepage_viewmodel.dart';
import 'package:countryproject/features/model/News_model.dart';
import 'package:countryproject/product/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'favoritespage_parts.dart';

class FavoritePage extends StatelessWidget {
 
   FavoritePage({super.key,required this.homePageViewModel});
  final  HomePageViewModel homePageViewModel; 
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider.value(
      value: homePageViewModel,
      builder:((context, child) {
        return Scaffold(
        appBar: AppBar(
          title:const Text("Provider-MVVM"),
          actions: [
            IconButton(onPressed: (){}, 
            icon: const Icon(Icons.favorite_border_sharp),color: Colors.red,)
          ],
        ),
        body:Padding(
          padding:  PagePadding.high(),
          child: GridViewBuilderMethod(homePageViewModel,context),
        ) ,
      );
      }) 
    );  
  }
  // Widget GridViewBuilderMethod(HomePageViewModel homePageViewModel,BuildContext context) {
  // return context.read<HomePageViewModel>().favoritelist.isEmpty? Center(child: const Text("Hiç Favori Haber Yok",style: TextStyle(fontSize: 40),)):
  //    GridView.builder(
  //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //     crossAxisCount: 2, // Bir satırda iki eleman
  //     crossAxisSpacing: 8.0, // Yatayda elemanlar arası boşluk
  //     mainAxisSpacing: 8.0, // Dikeyde elemanlar arası boşluk
  //   ),
  //   itemCount: context.watch<HomePageViewModel>().favoritelist.length,
  //   itemBuilder: (context, index) {
  //      Result result=context.read<HomePageViewModel>().favoritelist[index];
  //     return GestureDetector(
  //     onTap: (){ 
  //       Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => DetailPage(result: result),
  //             ),
  //           );
  //     },
  //     child: Card(
  //       child: Stack(
  //         children: [
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Center(
  //                 child: Image.network(
  //                   result.image!,
  //                   height: 90.0,
  //                   width: 100.0,
  //                 ),
  //               ),
  //               Text(
  //                 result.name!,
  //                 style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
  //               ),
  //             ],
  //           ),
  //           Positioned(
  //             top: 1.0,
  //             right:1.0,
  //             child: IconButton(
  //               icon: Icon(Icons.favorite_border,color: context.watch<HomePageViewModel>().favoritelist.contains(result)==true? Colors.red:Colors.black ),
  //               onPressed: () {
  //                  homePageViewModel.AddfavoriteList(result);
  //                 print("Favori Listesi  ${context.read<HomePageViewModel>().favoritelist.length.toString()} ");
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  //   },
  // );
  // }

  
}

