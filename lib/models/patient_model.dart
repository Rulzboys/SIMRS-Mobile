/// Model data pasien yang sedang login.
class PatientModel {
  final String id;
  final String name;
  final String photoUrl;
  final String bloodType;
  final List<String> allergies;
  final double weightKg;
  final double heightCm;
  final String bpjsNumber;
  final String insuranceProvider;
  final String emergencyContactName;
  final String emergencyContactPhone;
  final String phone;
  final String email;

  const PatientModel({
    required this.id,
    required this.name,
    this.photoUrl = '',
    required this.bloodType,
    required this.allergies,
    required this.weightKg,
    required this.heightCm,
    this.bpjsNumber = '',
    this.insuranceProvider = '',
    this.emergencyContactName = '',
    this.emergencyContactPhone = '',
    this.phone = '',
    this.email = '',
  });

  factory PatientModel.dummy() {
    return const PatientModel(
      id: 'P-0001',
      name: 'Syahrur Ramadhani',
      bloodType: 'O+',
      allergies: ['Amoxicillin', 'Debu'],
      weightKg: 68,
      heightCm: 172,
      bpjsNumber: '0001234567890',
      insuranceProvider: 'BPJS Kesehatan',
      emergencyContactName: 'Siti Aminah',
      emergencyContactPhone: '0812xxxxxxx',
      phone: '0812xxxxxxx',
      email: 'syahrur@example.com',
    );
  }
}
