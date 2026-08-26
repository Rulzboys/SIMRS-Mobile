import '../models/chat_message_model.dart';
import 'api_service.dart';

/// Service konsultasi online dengan dokter (chat, upload dokumen/lab).
class ConsultationService extends ApiService {
  Future<List<ChatMessageModel>> getChatHistory(String doctorId) async {
    await simulateDelay();
    final now = DateTime.now();
    return [
      ChatMessageModel(
        id: '1',
        sender: ChatSender.doctor,
        message: 'Selamat siang, ada yang bisa saya bantu?',
        timestamp: now.subtract(const Duration(minutes: 10)),
      ),
      ChatMessageModel(
        id: '2',
        sender: ChatSender.patient,
        message: 'Selamat siang dok, saya mau konsultasi hasil luka jahitan saya.',
        timestamp: now.subtract(const Duration(minutes: 8)),
      ),
    ];
  }

  Future<ChatMessageModel> sendMessage(String doctorId, String message) async {
    await simulateDelay();
    return ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      sender: ChatSender.patient,
      message: message,
      timestamp: DateTime.now(),
    );
  }
}
