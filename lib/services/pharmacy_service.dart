import '../models/medication_model.dart';
import 'api_service.dart';

/// Service e-resep dan status obat.
class PharmacyService extends ApiService {
  Future<List<MedicationModel>> getMedications() async {
    await simulateDelay();
    return MedicationModel.dummyList();
  }
}
