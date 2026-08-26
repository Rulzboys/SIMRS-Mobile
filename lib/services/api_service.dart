import '../core/constants/app_constants.dart';

/// Service dasar untuk komunikasi ke backend (Frappe REST API).
/// Saat ini masih berupa kerangka + delay simulasi, silakan sambungkan
/// dengan package http/dio dan endpoint asli sesuai kebutuhan.
class ApiService {
  final String baseUrl;

  ApiService({this.baseUrl = AppConstants.baseUrl});

  Future<void> simulateDelay() {
    return Future.delayed(AppConstants.mockNetworkDelay);
  }

  // Contoh kerangka pemanggilan API sesungguhnya:
  //
  // Future<Map<String, dynamic>> get(String endpoint) async {
  //   final response = await http.get(Uri.parse('$baseUrl$endpoint'));
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   }
  //   throw Exception('Gagal memuat data ($endpoint)');
  // }
}
