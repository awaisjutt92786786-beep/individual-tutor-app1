
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ماہانہ رپورٹ'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Card(
              child: ListTile(
                leading: Icon(Icons.people, color: Colors.teal),
                title: Text('کل طلبہ'),
                subtitle: Text('طلبہ کی تعداد یہاں ظاہر ہوگی'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.payments, color: Colors.green),
                title: Text('وصول شدہ فیس'),
                subtitle: Text('فیس کی رقم یہاں ظاہر ہوگی'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.pending_actions, color: Colors.orange),
                title: Text('باقی فیس'),
                subtitle: Text('باقی فیس یہاں ظاہر ہوگی'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.calendar_month, color: Colors.blue),
                title: Text('ماہانہ حاضری'),
                subtitle: Text('حاضری کی رپورٹ یہاں ظاہر ہوگی'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
