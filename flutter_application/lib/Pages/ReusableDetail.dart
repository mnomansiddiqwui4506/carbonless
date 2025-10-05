import 'package:flutter/material.dart';

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
  State<CertificationDetailPage> createState() => _CertificationDetailPageState();
}

class _CertificationDetailPageState extends State<CertificationDetailPage> {
  bool _isChallengeCompleted = false;
  double _progress = 0.0;

  void _updateProgress(double value) {
    setState(() {
      _progress = value;
      if (_progress == 1.0) {
        _isChallengeCompleted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: Padding(
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
              value: _progress,
              minHeight: 10,
              color: Colors.green,
              backgroundColor: Colors.green.shade100,
            ),
            const SizedBox(height: 10),
            Text(
              'Progress: ${( _progress * 100 ).toInt()}%',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            // Buttons to simulate progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if (_progress < 1.0) {
                      _updateProgress((_progress + 0.25).clamp(0.0, 1.0));
                    }
                  },
                  icon: const Icon(Icons.trending_up),
                  label: const Text("Add Progress"),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade600,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    setState(() {
                      _progress = 0.0;
                      _isChallengeCompleted = false;
                    });
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                ),
              ],
            ),

            const SizedBox(height: 40),

            if (_isChallengeCompleted)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check_circle, color: Colors.green, size: 28),
                    SizedBox(width: 8),
                    Text(
                      "Challenge Completed!",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
