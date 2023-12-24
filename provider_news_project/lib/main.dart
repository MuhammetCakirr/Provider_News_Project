import 'package:countryproject/features/HomePage/homepage_view.dart';
import 'package:countryproject/features/HomePage/homepage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      home:  HomePage(),
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.teal,fontSize: 20)  
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

