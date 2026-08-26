enum InvoiceStatus { unpaid, paid, pending }

/// Model tagihan / invoice pasien.
class InvoiceModel {
  final String id;
  final DateTime date;
  final double amount;
  final InvoiceStatus status;
  final String description;

  const InvoiceModel({
    required this.id,
    required this.date,
    required this.amount,
    required this.status,
    required this.description,
  });

  static List<InvoiceModel> dummyList() {
    final now = DateTime.now();
    return [
      InvoiceModel(
        id: 'INV-001',
        date: now.subtract(const Duration(days: 1)),
        amount: 350000,
        status: InvoiceStatus.unpaid,
        description: 'Konsultasi Poli Penyakit Dalam + Obat',
      ),
      InvoiceModel(
        id: 'INV-002',
        date: now.subtract(const Duration(days: 25)),
        amount: 520000,
        status: InvoiceStatus.paid,
        description: 'Pemeriksaan Laboratorium + Konsultasi',
      ),
    ];
  }

  static double get totalUnpaid => dummyList()
      .where((e) => e.status == InvoiceStatus.unpaid)
      .fold(0, (sum, e) => sum + e.amount);
}
