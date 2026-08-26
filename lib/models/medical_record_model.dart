enum MedicalRecordType { checkup, diagnosis, surgery, vaccine, allergy }

/// Model riwayat rekam medis pasien.
class MedicalRecordModel {
  final String id;
  final DateTime date;
  final String title;
  final String doctorName;
  final MedicalRecordType type;
  final String description;

  const MedicalRecordModel({
    required this.id,
    required this.date,
    required this.title,
    required this.doctorName,
    required this.type,
    required this.description,
  });

  static List<MedicalRecordModel> dummyList() {
    final now = DateTime.now();
    return [
      MedicalRecordModel(
        id: 'MR-001',
        date: now.subtract(const Duration(days: 25)),
        title: 'Influenza',
        doctorName: 'Dr. Andi Saputra, Sp.PD',
        type: MedicalRecordType.diagnosis,
        description:
            'Pasien datang dengan keluhan demam, batuk, dan pilek selama 3 hari. '
            'Diberikan terapi simptomatik dan istirahat cukup.',
      ),
      MedicalRecordModel(
        id: 'MR-002',
        date: now.subtract(const Duration(days: 90)),
        title: 'Vaksinasi Tetanus',
        doctorName: 'Dr. Maya Kusuma, Sp.A',
        type: MedicalRecordType.vaccine,
        description: 'Vaksinasi rutin tetanus toxoid, tidak ada reaksi alergi.',
      ),
      MedicalRecordModel(
        id: 'MR-003',
        date: now.subtract(const Duration(days: 200)),
        title: 'Kontrol Rutin',
        doctorName: 'Dr. Andi Saputra, Sp.PD',
        type: MedicalRecordType.checkup,
        description: 'Kontrol rutin tekanan darah, hasil dalam batas normal.',
      ),
    ];
  }
}
