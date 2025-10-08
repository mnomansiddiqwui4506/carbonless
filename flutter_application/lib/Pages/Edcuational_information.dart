import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/Articles.dart';
import 'package:flutter_application/Pages/VideosPage.dart';
import 'package:flutter_application/Pages/infographic.dart';



class EducationalInformation extends StatefulWidget {
  const EducationalInformation({super.key});

  @override
  State<EducationalInformation> createState() => _EducationalInformationState();
}

class _EducationalInformationState extends State<EducationalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F4),
      appBar: AppBar(
        title: const Text('Educational Content'),
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          EducationalCard(
            title: 'Articles',
            icon: Icons.article_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ArticlesPage()),
              );
            },
          ),
          const SizedBox(height: 12),
          EducationalCard(
            title: 'Videos',
            icon: Icons.ondemand_video,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const VideosPage()),
              );
            },
          ),
          const SizedBox(height: 12),
          EducationalCard(
            title: 'Infographics',
            icon: Icons.insert_chart_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const InfographicsPage()),
              );
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Purpose',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            '''
This educational section helps users:

• Stay informed about global and local environmental challenges.
• Learn practical tips for sustainability.
• Feel motivated to take eco-friendly actions in their own lives.
            ''',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class EducationalCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const EducationalCard({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.green.shade200),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.green.shade700),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

