import 'package:countryproject/features/model/News_model.dart';
import 'package:countryproject/product/page_padding.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Result result;
  const DetailPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text("Provider-MVVM"),
          actions: [
            IconButton(onPressed: (){}, 
            icon: const Icon(Icons.favorite_border_sharp),color: Colors.red,)
          ],
        ),
      body: Padding(
        padding: PagePadding.low(),
        child: Column(
          children: [
            Image.network(result.image.toString()),
            Text("Başlık:${result.name}"),
            Text("Açıklama:${result.description}"),
            Text("Kaynak:${result.source}")
          ],    
        ),
      ),
    );
  }
}