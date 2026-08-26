import '../models/radiology_model.dart';
import 'api_service.dart';

/// Service hasil radiologi.
class RadiologyService extends ApiService {
  Future<List<RadiologyModel>> getRadiologyResults() async {
    await simulateDelay();
    return RadiologyModel.dummyList();
  }
}
