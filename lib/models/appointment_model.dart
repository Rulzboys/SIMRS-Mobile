enum AppointmentStatus { upcoming, completed, cancelled }

/// Model janji temu / booking dokter.
class AppointmentModel {
  final String id;
  final String doctorName;
  final String doctorPhotoUrl;
  final String specialty;
  final String hospitalName;
  final String clinicName;
  final DateTime dateTime;
  final AppointmentStatus status;

  const AppointmentModel({
    required this.id,
    required this.doctorName,
    this.doctorPhotoUrl = '',
    required this.specialty,
    required this.hospitalName,
    required this.clinicName,
    required this.dateTime,
    required this.status,
  });

  static List<AppointmentModel> dummyList() {
    final now = DateTime.now();
    return [
      AppointmentModel(
        id: 'APT-001',
        doctorName: 'Dr. Andi Saputra, Sp.PD',
        specialty: 'Penyakit Dalam',
        hospitalName: 'RS Sehat Sentosa',
        clinicName: 'Poli Penyakit Dalam',
        dateTime: now.add(const Duration(days: 1, hours: 2)),
        status: AppointmentStatus.upcoming,
      ),
      AppointmentModel(
        id: 'APT-002',
        doctorName: 'Dr. Maya Kusuma, Sp.A',
        specialty: 'Anak',
        hospitalName: 'RS Sehat Sentosa',
        clinicName: 'Poli Anak',
        dateTime: now.subtract(const Duration(days: 10)),
        status: AppointmentStatus.completed,
      ),
      AppointmentModel(
        id: 'APT-003',
        doctorName: 'Dr. Budi Hartono, Sp.THT',
        specialty: 'THT',
        hospitalName: 'RS Sehat Sentosa',
        clinicName: 'Poli THT',
        dateTime: now.subtract(const Duration(days: 3)),
        status: AppointmentStatus.cancelled,
      ),
    ];
  }
}
