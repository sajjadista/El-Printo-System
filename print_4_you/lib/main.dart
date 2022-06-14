import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:print_4_you/pages/login_page.dart';
import 'package:print_4_you/pages/main_page.dart';
import 'package:print_4_you/pages/upload_document_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Print4You',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFFE40323),
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        home: const MainPage(),
        routes: <String, WidgetBuilder>{
          '/loginpage': (BuildContext context) => const LoginPage(),
          '/mainpage': (BuildContext context) => const MainPage(),
        });
  }
}
