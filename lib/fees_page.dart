
import 'package:flutter/material.dart';

class FeesPage extends StatefulWidget {
  const FeesPage({super.key});

  @override
  State<FeesPage> createState() => _FeesPageState();
}

class _FeesPageState extends State<FeesPage> {
  final List<Map<String, dynamic>> fees = [];

  final nameController = TextEditingController();
  final amountController = TextEditingController();

  int get totalReceived => fees.fold(
        0,
        (sum, item) => sum + (item['amount'] as int),
      );

  void addFee() {
    final name = nameController.text.trim();
    final amount = int.tryParse(amountController.text) ?? 0;

    if (name.isEmpty || amount <= 0) return;

    setState(() {
      fees.add({
        'name': name,
        'amount': amount,
        'date': DateTime.now(),
      });
    });

    nameController.clear();
    amountController.clear();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('فیس کا ریکارڈ')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
              title: const Text('فیس وصول کریں'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'طالب علم کا نام',
                    ),
                  ),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'وصول شدہ فیس',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('واپس'),
                ),
                ElevatedButton(
                  onPressed: addFee,
                  child: const Text('محفوظ کریں'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            child: ListTile(
              leading: const Icon(Icons.payments, color: Colors.green),
              title: const Text('کل وصول شدہ فیس'),
              subtitle: Text(
                'Rs. $totalReceived',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: fees.isEmpty
                ? const Center(child: Text('ابھی کوئی فیس درج نہیں'))
                : ListView.builder(
                    itemCount: fees.length,
                    itemBuilder: (context, index) {
                      final fee = fees[index];

                      return ListTile(
                        leading: const Icon(Icons.receipt),
                        title: Text(fee['name']),
                        subtitle: Text(
                          'Rs. ${fee['amount']}',
                        ),
                        trailing: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
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
