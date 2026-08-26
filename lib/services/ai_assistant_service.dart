import '../models/chat_message_model.dart';
import 'api_service.dart';

/// Service AI Health Assistant.
/// Bisa disambungkan ke Claude API / LLM backend milik SIMRS.
class AiAssistantService extends ApiService {
  Future<ChatMessageModel> sendMessage(String userMessage) async {
    await simulateDelay();

    final reply = _generateMockReply(userMessage);
    return ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      sender: ChatSender.ai,
      message: reply,
      timestamp: DateTime.now(),
    );
  }

  String _generateMockReply(String userMessage) {
    final text = userMessage.toLowerCase();

    if (text.contains('demam') || text.contains('batuk') || text.contains('pilek')) {
      return 'Berdasarkan gejala yang Anda sebutkan, kemungkinan mengarah ke Common Cold '
          'atau Influenza ringan. Disarankan istirahat cukup, minum air putih, dan '
          'periksa ke Poli Umum bila gejala tidak membaik dalam 3 hari.\n\n'
          'Catatan: ini bukan diagnosis medis, hanya edukasi awal.';
    }
    if (text.contains('jam buka')) {
      return 'Rumah sakit buka setiap hari pukul 07.00 - 21.00 WIB, sedangkan IGD melayani 24 jam.';
    }
    if (text.contains('obat') || text.contains('paracetamol')) {
      return 'Paracetamol umumnya diminum saat demam atau nyeri, maksimal 3-4 kali sehari '
          'sesuai anjuran dokter, dan sebaiknya setelah makan.';
    }
    if (text.contains('hasil lab')) {
      return 'Hasil laboratorium terakhir Anda menunjukkan HbA1c sedikit di atas normal (6.8%), '
          'sedangkan Hemoglobin dalam rentang normal. Saya sarankan diskusikan lebih lanjut '
          'dengan dokter Anda.';
    }
    if (text.contains('ringkas') || text.contains('riwayat')) {
      return 'Dalam 1 tahun terakhir, Anda tercatat 3 kali kunjungan: kontrol rutin, '
          'vaksinasi tetanus, dan penanganan influenza. Tidak ada catatan alergi baru.';
    }
    return 'Terima kasih atas pertanyaannya. Saya akan bantu carikan informasinya. '
        'Bisa dijelaskan lebih detail keluhan atau pertanyaan Anda?';
  }
}
