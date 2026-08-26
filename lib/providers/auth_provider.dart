import 'package:flutter/foundation.dart';
import '../models/patient_model.dart';
import '../services/auth_service.dart';

/// Provider status autentikasi & data pasien yang sedang login.
class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  PatientModel? _patient;
  bool _isLoading = false;
  String? _errorMessage;

  PatientModel? get patient => _patient;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _patient != null;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _patient = await _authService.login(username: username, password: password);
      return true;
    } catch (e) {
      _errorMessage = 'Gagal masuk. Periksa kembali username/password Anda.';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _patient = null;
    notifyListeners();
  }
}
