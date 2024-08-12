import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_cart/pages/onboardingpage.dart';
import 'package:product_cart/pages/splashscreen.dart';
import 'package:product_cart/provider/cartprovider.dart';
import 'package:product_cart/provider/favouriteprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.inriaSerifTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
