import 'package:flutter/foundation.dart';
import '../models/medication_model.dart';
import '../services/pharmacy_service.dart';

/// Provider obat aktif / e-resep.
class PharmacyProvider extends ChangeNotifier {
  final PharmacyService _service = PharmacyService();

  List<MedicationModel> _medications = [];
  bool _isLoading = false;

  List<MedicationModel> get medications => _medications;
  bool get isLoading => _isLoading;

  Future<void> loadMedications() async {
    _isLoading = true;
    notifyListeners();
    _medications = await _service.getMedications();
    _isLoading = false;
    notifyListeners();
  }
}
