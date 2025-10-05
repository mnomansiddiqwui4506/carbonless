import 'package:flutter/material.dart';

/// 🌿 MAIN GREEN CERTIFICATION PAGE
class GreenCertification extends StatelessWidget {
  const GreenCertification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Green Certifications'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(12),
                color: Colors.green[50],
              ),
              child: const Text(
                'Green Certifications & Labels Guide',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Certifications list
            Expanded(
              child: ListView(
                children: [
                  CertificationTile(
                    title: 'Fair Trade',
                    icon: Icons.emoji_people,
                    description:
                        'Fair Trade ensures ethical treatment of workers and fair wages in developing countries.',
                  ),
                  CertificationTile(
                    title: 'Energy Star',
                    icon: Icons.energy_savings_leaf,
                    description:
                        'Energy Star-certified products are energy-efficient and help reduce greenhouse gas emissions.',
                  ),
                  CertificationTile(
                    title: 'Organic',
                    icon: Icons.eco,
                    description:
                        'Organic labels indicate that food or products are grown without synthetic fertilizers or pesticides.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ✅ REUSABLE TILE FOR CERTIFICATIONS
class CertificationTile extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const CertificationTile({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 32),
        title: Text(title),
        subtitle: Text(description),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const Text('Start'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CertificationDetailPage(
                  title: title,
                  description: description,
                  icon: icon,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// 🌱 DETAIL PAGE WITH 7-DAY CHALLENGE TRACKER
class CertificationDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const CertificationDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<CertificationDetailPage> createState() =>
      _CertificationDetailPageState();
}

class _CertificationDetailPageState extends State<CertificationDetailPage> {
  List<bool> dayCompleted = List.generate(7, (_) => false);

  double get progress =>
      dayCompleted.where((completed) => completed).length / dayCompleted.length;

  void _checkCompletion() {
    if (dayCompleted.every((day) => day)) {
      // Show SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "🎉 Congratulations! Challenge Completed!",
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      // Redirect to success message
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const ChallengeSuccessPage(),
          ),
          (route) => false,
        );
      });
    }
  }

  /// 🌍 Daily eco-tips
  String _getDailyTip(int index) {
    switch (index) {
      case 0:
        return "Use a reusable water bottle today.";
      case 1:
        return "Avoid plastic bags — bring your own tote.";
      case 2:
        return "Say no to plastic straws and cutlery.";
      case 3:
        return "Buy something packaged in recyclable material.";
      case 4:
        return "Recycle 3 plastic items properly.";
      case 5:
        return "Share your eco-tip with a friend!";
      case 6:
        return "Reflect on your plastic-free week 🌱";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(widget.icon, size: 80, color: Colors.green),
            const SizedBox(height: 20),

            Text(
              widget.description,
              style: const TextStyle(fontSize: 18, height: 1.5),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // Progress bar
            LinearProgressIndicator(
              value: progress,
              minHeight: 12,
              color: Colors.green,
              backgroundColor: Colors.green.shade100,
            ),
            const SizedBox(height: 10),
            Text(
              'Progress: ${(progress * 100).toInt()}%',
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 30),

            // 7-Day checklist
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: List.generate(7, (index) {
                  return CheckboxListTile(
                    activeColor: Colors.green,
                    title: Text('Day ${index + 1}'),
                    subtitle: Text(_getDailyTip(index)),
                    value: dayCompleted[index],
                    onChanged: (bool? value) {
                      setState(() {
                        dayCompleted[index] = value ?? false;
                      });
                      _checkCompletion();
                    },
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  for (int i = 0; i < dayCompleted.length; i++) {
                    dayCompleted[i] = true;
                  }
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "🎉 Challenge Completed!",
                      style: TextStyle(fontSize: 16),
                    ),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );

                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChallengeSuccessPage(),
                    ),
                    (route) => false,
                  );
                });
              },
              icon: const Icon(Icons.check_circle, color: Colors.white),
              label: const Text(
                "Complete Challenge",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🎉 FINAL SUCCESS PAGE
class ChallengeSuccessPage extends StatelessWidget {
  const ChallengeSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => const GreenCertification()), // 👈 Redirect back
        (route) => false,
      );
    });

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text("Green Certification"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            "🎉 Congratulations!\nYou earned your Green Certification!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
