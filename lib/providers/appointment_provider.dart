import 'package:flutter/foundation.dart';
import '../models/appointment_model.dart';
import '../services/appointment_service.dart';

/// Provider daftar & aksi appointment.
class AppointmentProvider extends ChangeNotifier {
  final AppointmentService _service = AppointmentService();

  List<AppointmentModel> _appointments = [];
  bool _isLoading = false;

  List<AppointmentModel> get appointments => _appointments;
  bool get isLoading => _isLoading;

  List<AppointmentModel> get upcoming => _appointments
      .where((a) => a.status == AppointmentStatus.upcoming)
      .toList();

  AppointmentModel? get nextAppointment {
    final list = upcoming;
    if (list.isEmpty) return null;
    list.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return list.first;
  }

  Future<void> loadAppointments() async {
    _isLoading = true;
    notifyListeners();
    _appointments = await _service.getAppointments();
    _isLoading = false;
    notifyListeners();
  }
}
