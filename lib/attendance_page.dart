
import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final List<String> students = [];
  final Map<String, bool> attendance = {};

  final nameController = TextEditingController();

  void addStudent() {
    final name = nameController.text.trim();

    if (name.isEmpty) return;

    setState(() {
      students.add(name);
      attendance[name] = false;
    });

    nameController.clear();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final presentCount = attendance.values.where((v) => v).length;

    return Scaffold(
      appBar: AppBar(title: const Text('طلبہ کی حاضری')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
              title: const Text('طالب علم شامل کریں'),
              content: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'طالب علم کا نام',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('واپس'),
                ),
                ElevatedButton(
                  onPressed: addStudent,
                  child: const Text('شامل کریں'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'حاضر طلبہ: $presentCount / ${students.length}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: students.isEmpty
                ? const Center(child: Text('پہلے طالب علم شامل کریں'))
                : ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final name = students[index];

                      return CheckboxListTile(
                        title: Text(name),
                        subtitle: Text(
                          attendance[name] == true ? 'حاضر' : 'غیر حاضر',
                        ),
                        value: attendance[name] ?? false,
                        onChanged: (value) {
                          setState(() {
                            attendance[name] = value ?? false;
                          });
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
