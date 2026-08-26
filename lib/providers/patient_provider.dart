import 'package:flutter/foundation.dart';
import '../models/patient_model.dart';
import '../services/patient_service.dart';

/// Provider data profil pasien.
class PatientProvider extends ChangeNotifier {
  final PatientService _service = PatientService();

  PatientModel? _patient;
  bool _isLoading = false;

  PatientModel? get patient => _patient;
  bool get isLoading => _isLoading;

  Future<void> loadProfile() async {
    _isLoading = true;
    notifyListeners();
    _patient = await _service.getProfile();
    _isLoading = false;
    notifyListeners();
  }
}
