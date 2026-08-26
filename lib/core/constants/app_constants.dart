/// Konstanta umum aplikasi.
class AppConstants {
  AppConstants._();

  static const String appName = 'SIMRS AI';
  static const String appTagline = 'Digital Health Companion';

  // Ganti baseUrl ini dengan endpoint Frappe/SIMRS backend yang sebenarnya.
  static const String baseUrl = 'https://simrs.example.com/api';

  static const Duration mockNetworkDelay = Duration(milliseconds: 600);
}
