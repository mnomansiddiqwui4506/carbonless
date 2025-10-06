import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/Home.dart'; // Replace with your actual Home page if exists



class EnergyConservation extends StatefulWidget {
  const EnergyConservation({super.key});

  @override
  State<EnergyConservation> createState() => _EnergyConservationState();
}

class _EnergyConservationState extends State<EnergyConservation> {
  int _selectedIndex = 0;

  // Pages for BottomNavigationBar
  final List<Widget> _pages = [
  const TipsPage(),            // ✅ Use this instead of EnergyConservation
  const GreenCertification(),  // Your other page
];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Personalized Energy Tips' : 'Home'),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green.shade700,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Tips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}

// ===================
// Tips Page
// ===================
class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> tips = [
    {
      'icon': Icons.lightbulb_outline,
      'text': 'Turn off lights when not in use',
      'details': 'Switch off lights in rooms you are not using to save electricity.',
      'category': 'Appliances',
    },
    {
      'icon': Icons.power_settings_new,
      'text': 'Unplug unused mobile chargers',
      'details': 'Even when not charging, chargers consume electricity if plugged in.',
      'category': 'Appliances',
    },
    {
      'icon': Icons.thermostat_outlined,
      'text': 'Optimize your heating/cooling',
      'details': 'Set thermostat to an energy-efficient temperature to save electricity.',
      'category': 'Heating/Cooling',
    },
    {
      'icon': Icons.eco_outlined,
      'text': 'Switch to LED bulbs',
      'details': 'LED bulbs use up to 80% less energy than traditional bulbs.',
      'category': 'Appliances',
    },
    {
      'icon': Icons.solar_power_outlined,
      'text': 'Use renewable energy',
      'details': 'Consider installing solar panels or using green energy plans.',
      'category': 'Renewable Energy',
    },
  ];

  void onTipTap(Map<String, dynamic> tip) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TipDetailPage(tip: tip)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredTips = selectedCategory == 'All'
        ? tips
        : tips.where((tip) => tip['category'] == selectedCategory).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ['All', 'Appliances', 'Heating/Cooling', 'Renewable Energy']
                  .map((category) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ChoiceChip(
                          label: Text(category),
                          selected: selectedCategory == category,
                          selectedColor: Colors.green.shade300,
                          onSelected: (selected) {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: filteredTips.isEmpty
                ? Center(
                    child: Text(
                      'No tips found!',
                      style: TextStyle(fontSize: 18, color: Colors.green.shade700),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredTips.length,
                    itemBuilder: (context, index) {
                      final tip = filteredTips[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          onTap: () => onTipTap(tip),
                          title: Text(tip['text']),
                          subtitle: Text(
                            "Tap for details",
                            style: TextStyle(color: Colors.green.shade700),
                          ),
                          trailing: Icon(tip['icon'], color: Colors.green),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ===================
// Tip Detail Page
// ===================
class TipDetailPage extends StatelessWidget {
  final Map<String, dynamic> tip;
  const TipDetailPage({super.key, required this.tip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tip['text']),
        backgroundColor: Colors.green.shade700,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.green.shade100,
            padding: const EdgeInsets.all(40),
            child: Icon(tip['icon'], size: 80, color: Colors.green.shade700),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tip['text'],
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(tip['details'], style: const TextStyle(fontSize: 18)),
                  const Spacer(),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        // Share logic here
                      },
                      icon: const Icon(Icons.share),
                      label: const Text('Share'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

