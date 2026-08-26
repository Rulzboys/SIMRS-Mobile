import '../models/patient_model.dart';
import 'api_service.dart';

/// Service autentikasi pasien (login, logout, sesi).
class AuthService extends ApiService {
  Future<PatientModel> login({
    required String username,
    required String password,
  }) async {
    await simulateDelay();
    // TODO: ganti dengan panggilan API login sesungguhnya.
    return PatientModel.dummy();
  }

  Future<void> logout() async {
    await simulateDelay();
    // TODO: hapus token/sesi tersimpan.
  }
}
