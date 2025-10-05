import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/Home.dart';
// Make sure this exists

class ChallengePage extends StatelessWidget {
  final String challengeTitle;

  const ChallengePage({super.key, required this.challengeTitle});

  final List<String> challengeTasks = const [
    "Buy a Fair Trade product",
    "Use an Energy Star appliance",
    "Purchase an Organic item",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(challengeTitle),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Complete these tasks to finish the challenge!",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: challengeTasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.eco, color: Colors.green),
                      title: Text(challengeTasks[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
              child: const Text("Mark as Completed"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Challenge Completed!"),
                    content: const Text("Great job 🌿 You've earned a badge!"),
                    actions: [
                      TextButton(
                        child: const Text("OK"),
                        onPressed: () {
                          Navigator.pop(context); // Close dialog
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const GreenCertification(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
