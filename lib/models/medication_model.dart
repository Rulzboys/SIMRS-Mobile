enum PrescriptionStatus { processing, ready, taken, expired }

/// Model obat aktif / e-resep pasien.
class MedicationModel {
  final String id;
  final String name;
  final String dosage;
  final String instructions;
  final PrescriptionStatus status;
  final DateTime prescribedDate;

  const MedicationModel({
    required this.id,
    required this.name,
    required this.dosage,
    required this.instructions,
    required this.status,
    required this.prescribedDate,
  });

  static List<MedicationModel> dummyList() {
    final now = DateTime.now();
    return [
      MedicationModel(
        id: 'MED-001',
        name: 'Paracetamol 500mg',
        dosage: '3x sehari, 1 tablet',
        instructions: 'Diminum setelah makan bila demam',
        status: PrescriptionStatus.ready,
        prescribedDate: now.subtract(const Duration(days: 1)),
      ),
      MedicationModel(
        id: 'MED-002',
        name: 'Amoxicillin 500mg',
        dosage: '3x sehari, 1 kapsul',
        instructions: 'Habiskan sesuai anjuran dokter',
        status: PrescriptionStatus.processing,
        prescribedDate: now.subtract(const Duration(days: 1)),
      ),
    ];
  }
}
