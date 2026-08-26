enum NotificationType {
  appointment,
  queue,
  medicationReminder,
  controlReminder,
  prescriptionReady,
  labResult,
  general,
}

/// Model notifikasi aplikasi.
class NotificationModel {
  final String id;
  final String title;
  final String message;
  final NotificationType type;
  final DateTime time;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.time,
    this.isRead = false,
  });

  static List<NotificationModel> dummyList() {
    final now = DateTime.now();
    return [
      NotificationModel(
        id: 'N-001',
        title: 'Nomor antrian Anda segera dipanggil',
        message: 'Nomor A-023 akan dipanggil dalam waktu 15 menit.',
        type: NotificationType.queue,
        time: now.subtract(const Duration(minutes: 5)),
      ),
      NotificationModel(
        id: 'N-002',
        title: 'Resep siap diambil',
        message: 'Obat Paracetamol 500mg sudah siap diambil di apotek.',
        type: NotificationType.prescriptionReady,
        time: now.subtract(const Duration(hours: 2)),
      ),
      NotificationModel(
        id: 'N-003',
        title: 'Pengingat jadwal kontrol',
        message: 'Jangan lupa jadwal kontrol Anda besok pukul 09.30 WIB.',
        type: NotificationType.controlReminder,
        time: now.subtract(const Duration(hours: 20)),
        isRead: true,
      ),
    ];
  }
}
