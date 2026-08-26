/// Model hasil pemeriksaan radiologi pasien.
class RadiologyModel {
  final String id;
  final String examType;
  final DateTime date;
  final String reportSummary;
  final String? aiExplanation;
  final String? imageUrl;

  const RadiologyModel({
    required this.id,
    required this.examType,
    required this.date,
    required this.reportSummary,
    this.aiExplanation,
    this.imageUrl,
  });

  static List<RadiologyModel> dummyList() {
    final now = DateTime.now();
    return [
      RadiologyModel(
        id: 'RAD-001',
        examType: 'X-Ray Thorax',
        date: now.subtract(const Duration(days: 20)),
        reportSummary: 'Cor dan pulmo dalam batas normal, tidak tampak infiltrat.',
        aiExplanation:
            'Hasil rontgen dada Anda menunjukkan kondisi jantung dan paru-paru yang normal, '
            'tidak ditemukan tanda-tanda infeksi atau kelainan berarti.',
      ),
    ];
  }
}
