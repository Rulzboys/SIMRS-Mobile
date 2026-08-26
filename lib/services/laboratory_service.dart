import '../models/lab_result_model.dart';
import 'api_service.dart';

/// Service hasil laboratorium.
class LaboratoryService extends ApiService {
  Future<List<LabResultModel>> getLabResults() async {
    await simulateDelay();
    return LabResultModel.dummyList();
  }
}
