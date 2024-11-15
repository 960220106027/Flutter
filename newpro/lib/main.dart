import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/Date.dart';
import 'package:newpro/Design/foodDesign.dart';
import 'package:newpro/alertDialog.dart';
import 'package:newpro/api/foodapi.dart';
import 'package:newpro/login.dart';
import 'package:newpro/signin.dart';
import 'package:newpro/snakbar.dart';
import 'package:newpro/splash.dart';
import 'package:newpro/time.dart';
import 'package:provider/provider.dart'; // Don't forget to import Provider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MealProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.cardoTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:LoginPage(),
        routes: {
          'categories': (context) => MealsScreen(),
        },
      ),
    );
  }
}
