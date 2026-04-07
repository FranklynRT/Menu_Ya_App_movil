import 'package:flutter/material.dart';
import './pages/loginPages.dart';
import './pages/homePages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú de Comida',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto', // Let's try to use a nice generic font
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      //Pantalla inicial 
      initialRoute: '/',
      routes: {
        '/' : (context) => const LoginScreen(),
        '/home' : (context) => HomeScreen(),
      }
    );
  }  
}