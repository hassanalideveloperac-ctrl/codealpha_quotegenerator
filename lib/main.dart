import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quote_provider.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuoteProvider()..loadRandomQuote(),
      child: MaterialApp(
        title: 'Quote Generator',
        theme: ThemeData(
          primaryColor: const Color(0xFF6C63FF),
          scaffoldBackgroundColor: const Color(0xFFF8F9FE),
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF6C63FF),
            secondary: Color(0xFFFFD700),
            tertiary: Color(0xFFFF6584),
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF6C63FF),
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
          ),
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}