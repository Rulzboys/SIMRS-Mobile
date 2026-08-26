import 'package:flutter/foundation.dart';
import '../models/lab_result_model.dart';
import '../services/laboratory_service.dart';

/// Provider hasil laboratorium.
class LaboratoryProvider extends ChangeNotifier {
  final LaboratoryService _service = LaboratoryService();

  List<LabResultModel> _results = [];
  bool _isLoading = false;

  List<LabResultModel> get results => _results;
  bool get isLoading => _isLoading;

  Future<void> loadResults() async {
    _isLoading = true;
    notifyListeners();
    _results = await _service.getLabResults();
    _isLoading = false;
    notifyListeners();
  }
}
