
import 'package:flutter/material.dart';
import 'student_page.dart';
import 'attendance_page.dart';
import 'fees_page.dart';
import 'report_page.dart';

void main() {
  runApp(const TutorApp());
}

class TutorApp extends StatelessWidget {
  const TutorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Tuition Management',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

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
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'السلام علیکم استاد صاحب!',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            dashboardButton(context, 'طلبہ کا ریکارڈ',
                Icons.people, const StudentPage()),
            dashboardButton(context, 'حاضری',
                Icons.fact_check, const AttendancePage()),
            dashboardButton(context, 'فیس کا ریکارڈ',
                Icons.payments, const FeesPage()),
            dashboardButton(context, 'ماہانہ رپورٹ',
                Icons.bar_chart, const ReportPage()),
          ],
        ),
      ),
    );
  }

  Widget dashboardButton(
    BuildContext context,
    String title,
    IconData icon,
    Widget page,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal, size: 30),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => openPage(context, page),
      ),
    );
  }
}
