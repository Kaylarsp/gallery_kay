import 'package:flutter/material.dart';
import 'package:gallery_kay/pages/home_page.dart';
import 'package:gallery_kay/state/gallery_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  ChangeNotifierProvider(
    create: (context) => GalleryState(),
    child: MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage()
    );
  } 
}