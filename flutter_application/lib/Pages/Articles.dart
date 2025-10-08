import 'package:flutter/material.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample article titles and short description
    final List<Map<String, String>> articles = [
      {
        'title': '🌍 Climate Change and Its Effects',
        'description': 'Understand how global warming is impacting our planet and what we can do to help.'
      },
      {
        'title': '♻️ Ways to Reduce Waste at Home',
        'description': 'Simple tips to minimize waste and recycle effectively in daily life.'
      },
      {
        'title': '💧 Water Conservation Tips',
        'description': 'Learn practical ways to save water and protect this precious resource.'
      },
      {
        'title': '🔋 Benefits of Renewable Energy',
        'description': 'Explore how solar and wind energy can make a positive environmental impact.'
      },
      {
        'title': '🌱 Planting Trees for a Greener Future',
        'description': 'Discover why tree planting is crucial for our ecosystem and climate.'
      },
      {
        'title': '🏠 Eco-Friendly Lifestyle Choices',
        'description': 'Adopt sustainable habits in your daily routine to reduce your carbon footprint.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                article['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  article['description']!,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              leading: const Icon(Icons.article, color: Colors.green),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // You can navigate to a detailed article page here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Clicked: ${article['title']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

