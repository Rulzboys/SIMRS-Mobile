import '../models/appointment_model.dart';
import 'api_service.dart';

/// Service booking & riwayat appointment.
class AppointmentService extends ApiService {
  Future<List<AppointmentModel>> getAppointments() async {
    await simulateDelay();
    return AppointmentModel.dummyList();
  }

  Future<void> bookAppointment({
    required String doctorName,
    required String clinicName,
    required DateTime dateTime,
  }) async {
    await simulateDelay();
    // TODO: kirim booking ke backend.
  }

  Future<void> rescheduleAppointment(String appointmentId, DateTime newDate) async {
    await simulateDelay();
    // TODO: kirim reschedule ke backend.
  }

  Future<void> cancelAppointment(String appointmentId) async {
    await simulateDelay();
    // TODO: kirim pembatalan ke backend.
  }
}
