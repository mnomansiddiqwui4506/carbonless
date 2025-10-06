import 'package:flutter/material.dart';

import 'package:flutter_application/Pages/EnergyConservation_tips.dart';

import 'package:flutter_application/Onboarding.dart';
import 'package:flutter_application/Pages/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
      title: 'Sustainable App',
      theme: ThemeData(primarySwatch: Colors.green),
      // Named routes
      routes: {
        '/': (context) => const Onboarding(),
        '/energy': (context) => const EnergyConservation(),
        '/green': (context) => const GreenCertification(),
      },
      initialRoute: '/',
    );
  }
}
