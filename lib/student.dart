
class Student {
  final String name;
  final String phone;
  final String address;
  final String subject;
  final int monthlyFee;

  Student({
    required this.name,
    required this.phone,
    required this.address,
    required this.subject,
    required this.monthlyFee,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'subject': subject,
      'monthlyFee': monthlyFee,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      subject: map['subject'] ?? '',
      monthlyFee: map['monthlyFee'] ?? 0,
    );
  }
}
