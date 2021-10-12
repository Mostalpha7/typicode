import 'package:flutter/material.dart';
import 'package:homefort/providers/photos_provider.dart';
import 'package:homefort/screens/all_photos_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PhotoProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homefort Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AllPhotoScreen(),
    );
  }
}
