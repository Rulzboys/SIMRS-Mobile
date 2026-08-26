import 'package:flutter/foundation.dart';
import '../models/medical_record_model.dart';
import '../services/medical_record_service.dart';

/// Provider riwayat rekam medis.
class MedicalRecordProvider extends ChangeNotifier {
  final MedicalRecordService _service = MedicalRecordService();

  List<MedicalRecordModel> _records = [];
  bool _isLoading = false;

  List<MedicalRecordModel> get records => _records;
  bool get isLoading => _isLoading;

  Future<void> loadRecords() async {
    _isLoading = true;
    notifyListeners();
    _records = await _service.getRecords();
    _isLoading = false;
    notifyListeners();
  }
}
