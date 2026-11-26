
import 'package:flutter/material.dart';

void main() {
  runApp(const TutorApp());
}

class TutorApp extends StatelessWidget {
  const TutorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Tuition',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ہوم ٹیوشن مینجمنٹ'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'السلام علیکم استاد صاحب!',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'اپنی ٹیوشن کا مکمل ریکارڈ یہاں سنبھالیں۔',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              dashboardCard(
                context,
                'طلبہ کا ریکارڈ',
                Icons.people,
                () => openPage(context, 'طلبہ کا ریکارڈ'),
              ),
              dashboardCard(
                context,
                'حاضری',
                Icons.fact_check,
                () => openPage(context, 'حاضری'),
              ),
              dashboardCard(
                context,
                'فیس کا ریکارڈ',
                Icons.payments,
                () => openPage(context, 'فیس کا ریکارڈ'),
              ),
              dashboardCard(
                context,
                'ماہانہ رپورٹ',
                Icons.bar_chart,
                () => openPage(context, 'ماہانہ رپورٹ'),
              ),
              dashboardCard(
                context,
                'سیٹنگز',
                Icons.settings,
                () => openPage(context, 'سیٹنگز'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal, size: 30),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  void openPage(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SimplePage(title: title),
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;

  const SimplePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          '$title کا صفحہ',
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
