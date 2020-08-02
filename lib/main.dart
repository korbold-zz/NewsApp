import 'package:flutter/material.dart';
import 'package:news_app/src/screens/home_screen.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsServiceProvider()),
      ],
      child: MaterialApp(home: SafeArea(child: HomeScreen())),
    );
  }
}
