import '../models/patient_model.dart';
import 'api_service.dart';

/// Service data profil pasien.
class PatientService extends ApiService {
  Future<PatientModel> getProfile() async {
    await simulateDelay();
    return PatientModel.dummy();
  }

  Future<void> updateProfile(PatientModel patient) async {
    await simulateDelay();
    // TODO: kirim data update ke backend.
  }
}
