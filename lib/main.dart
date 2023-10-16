// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/colors.dart';
import 'package:flutter_application_2/view/Screen/homeScreen.dart';
import 'package:flutter_application_2/view/Screen/loginScreen.dart';
import 'package:flutter_application_2/view/Screen/profile.dart';
import 'package:flutter_application_2/view/Screen/randevuScreen.dart';
import 'package:flutter_application_2/view/Screen/registerScreen.dart';
import 'package:flutter_application_2/view/Screen/view/hastaneRandevuscreen.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/tarihselect.dart';
import 'package:provider/provider.dart';

import 'Provider/RandevuAlmaProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RandevuAlmaProvider()),
        // Diğer sağlayıcıları burada ekleyebilirsiniz
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
            headlineSmall: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: ProjectColors.green),
            headlineLarge: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ProjectColors.yellow),
            headlineMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ProjectColors.green),
            bodyMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: ProjectColors.black),
            displayMedium: TextStyle(fontSize: 18, color: ProjectColors.green)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/register': (context) => const RegisterScreen(),
        '/profile': (context) => const ProfilScreen(),
        '/randevular': (context) => const RandevuScreen(),
        '/hastaneRandevu': (context) => const HastaneRandevuScreen(),
        'DateSelect': (context) => const DateSelect(),
      },
    );
  }
}
