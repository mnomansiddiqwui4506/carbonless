import 'package:flutter/material.dart';
import 'challenge_page.dart';

class JoinChallengesPage extends StatelessWidget {
  const JoinChallengesPage({super.key});

  final List<Map<String, String>> availableChallenges = const [
    {
      "title": "Plastic-Free Week",
      "description": "Avoid single-use plastic for 7 days.",
    },
    {
      "title": "Plant a Tree",
      "description": "Plant a tree in your neighborhood or garden.",
    },
    {
      "title": "Cycle to Work",
      "description": "Use a bicycle instead of a car for one week.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join Challenges"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: availableChallenges.length,
        itemBuilder: (context, index) {
          final challenge = availableChallenges[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(challenge["title"]!),
              subtitle: Text(challenge["description"]!),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text("Join"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChallengePage(
                        challengeTitle: challenge["title"]!,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
