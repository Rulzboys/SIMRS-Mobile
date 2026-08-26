import '../models/medical_record_model.dart';
import 'api_service.dart';

/// Service rekam medis pasien.
class MedicalRecordService extends ApiService {
  Future<List<MedicalRecordModel>> getRecords() async {
    await simulateDelay();
    return MedicalRecordModel.dummyList();
  }
}
