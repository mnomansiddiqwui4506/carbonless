
import 'package:flutter/material.dart';

class InfographicsPage extends StatelessWidget {
  const InfographicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final infographics = [
      {
        'image': 'images/download.jpeg',
        'title': '5 Ways to Save Energy at Home',
      },
      {
        'image': 'images/plastic_journey.jpeg',
        'title': 'The Journey of Plastic Waste',
      },
      {
        'image': 'images/trees_reduce_co2.jpeg',
        'title': 'How Trees Help Reduce CO₂ Levels',
      },
      {
        'image': 'images/recycling_tips.jpeg',
        'title': 'Simple Recycling Tips',
      },
      {
        'image': 'images/SaveWater.jpeg',
        'title': 'Save Water, Save Life',
      },

      {
        'image': 'images/renewable_energy.jpeg',
        'title': 'Save Water, Save Life',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Infographics 📊'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Scrollbar(
          thumbVisibility: true, // ✅ always show scrollbar thumb
          radius: const Radius.circular(8),
          thickness: 6, // ✅ scrollbar width
          child: GridView.builder(
            itemCount: infographics.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ✅ 2 items per row
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85, // ✅ Adjust height vs width
            ),
            itemBuilder: (context, index) {
              final item = infographics[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        item['image']!,
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}