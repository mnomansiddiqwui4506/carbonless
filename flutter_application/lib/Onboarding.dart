import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/EnergyConservation_tips.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  double _progress = 0.0;
  bool _loadingComplete = false;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        if (_progress >= 1.0) {
          _loadingComplete = true;
          timer.cancel();
        } else {
          _progress += 0.01;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _loadingComplete ? Colors.white : Colors.green,
      body: Center(
        child: _loadingComplete ? _buildMainContent() : _buildLoader(),
      ),
    );
  }

  // Loader with bold white text on green background
  Widget _buildLoader() {
    return Text(
      '${(_progress * 100).toInt()}%',
      style: const TextStyle(
        fontSize: 70,
        
        color: Colors.white, // White text
        fontWeight: FontWeight.bold, // Bold
      ),
    );
  }

  // Main Onboarding Screen
  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sustainable Living Guide',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFF1A6531),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Image.asset(
            'images/earth_leaf.png', // Make sure this image exists in assets/images/
            height: 100,
          ),
          const SizedBox(height: 24),
          const Text(
            'Your companion to living a greener lifestyle',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const EnergyConservation()),
);

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
