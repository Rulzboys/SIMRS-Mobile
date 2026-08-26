import 'package:flutter/foundation.dart';
import '../models/radiology_model.dart';
import '../services/radiology_service.dart';

/// Provider hasil radiologi.
class RadiologyProvider extends ChangeNotifier {
  final RadiologyService _service = RadiologyService();

  List<RadiologyModel> _results = [];
  bool _isLoading = false;

  List<RadiologyModel> get results => _results;
  bool get isLoading => _isLoading;

  Future<void> loadResults() async {
    _isLoading = true;
    notifyListeners();
    _results = await _service.getRadiologyResults();
    _isLoading = false;
    notifyListeners();
  }
}
