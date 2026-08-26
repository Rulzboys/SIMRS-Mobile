/// Model hasil laboratorium pasien.
class LabResultModel {
  final String id;
  final String testName;
  final String value;
  final String unit;
  final String normalRange;
  final DateTime date;
  final String? aiSummary;
  final bool isAbnormal;

  const LabResultModel({
    required this.id,
    required this.testName,
    required this.value,
    required this.unit,
    required this.normalRange,
    required this.date,
    this.aiSummary,
    this.isAbnormal = false,
  });

  static List<LabResultModel> dummyList() {
    final now = DateTime.now();
    return [
      LabResultModel(
        id: 'LAB-001',
        testName: 'HbA1c',
        value: '6.8',
        unit: '%',
        normalRange: '< 5.7%',
        date: now.subtract(const Duration(days: 5)),
        isAbnormal: true,
        aiSummary:
            'Nilai HbA1c sedikit di atas normal, menunjukkan kadar gula darah rata-rata '
            '3 bulan terakhir cenderung tinggi. Disarankan konsultasi lebih lanjut dengan dokter.',
      ),
      LabResultModel(
        id: 'LAB-002',
        testName: 'Hemoglobin',
        value: '14.2',
        unit: 'g/dL',
        normalRange: '13.0 - 17.0 g/dL',
        date: now.subtract(const Duration(days: 5)),
        isAbnormal: false,
        aiSummary: 'Kadar hemoglobin normal, tidak ada indikasi anemia.',
      ),
    ];
  }
}
