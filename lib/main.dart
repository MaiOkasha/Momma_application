import 'package:flutter/material.dart';
import 'package:vp12_ui_application/screens/app/categories_screen.dart';
import 'package:vp12_ui_application/screens/app/drawer/about_app_screen.dart';
import 'package:vp12_ui_application/screens/app/drawer/faqs_screen.dart';
import 'package:vp12_ui_application/screens/app/drawer/test_screen.dart';
import 'package:vp12_ui_application/screens/app/home_screen.dart';
import 'package:vp12_ui_application/screens/app/main_screen.dart';
import 'package:vp12_ui_application/screens/auth/login_screen.dart';
import 'package:vp12_ui_application/screens/app/products.dart';
import 'package:vp12_ui_application/screens/auth/register_screen.dart';
import 'package:vp12_ui_application/screens/launch_screen.dart';
import 'package:vp12_ui_application/screens/out_boarding_screen.dart';

void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes:{
        '/launch_screen':(context)=> const LaunchScreen(),
        '/out_boarding_screen':(context)=> const OutBoardingScreen(),
        '/login_screen' : (context)=> const LoginScreen(),
        '/register_screen' : (context)=> const RegisterScreen(),
        '/home_screen' : (context)=> const HomeScreen(),
        '/categories_screen' : (context)=>const CategoriesScreen(),
        '/products_screen' : (context)=>const ProductsScreen(),
        '/main_screen' : (context)=>const MainScreen(),
        '/faqs_screen' : (context)=>const FAQsScreen(),
        '/about_app_screen' : (context)=> const AboutAppScreen(),
        '/test_screen' : (context)=> const TestScreen(),


      } ,
    );
  }
}
