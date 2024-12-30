import 'package:flutter/material.dart';
import 'package:flutter_newsapp/controller/catagorycontroller.dart';
import 'package:flutter_newsapp/controller/home_screen_controller.dart';
import 'package:flutter_newsapp/controller/saved_news_controller.dart';
import 'package:flutter_newsapp/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(create: (context) => CategoryController()),
        ChangeNotifierProvider(create: (context) => SavedNewsController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
