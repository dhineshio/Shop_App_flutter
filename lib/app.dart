import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:shop_app/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.yellow,
              primary: const Color.fromARGB(255, 224, 191, 0),
            ),
            textTheme: const TextTheme(
                titleMedium:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                titleSmall:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            useMaterial3: true),
        home: const HomeScreen(),
      ),
    );
  }
}
