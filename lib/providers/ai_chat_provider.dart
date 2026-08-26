import 'package:flutter/foundation.dart';
import '../models/chat_message_model.dart';
import '../services/ai_assistant_service.dart';

/// Provider percakapan dengan AI Health Assistant.
class AiChatProvider extends ChangeNotifier {
  final AiAssistantService _service = AiAssistantService();

  final List<ChatMessageModel> _messages = [
    ChatMessageModel(
      id: 'welcome',
      sender: ChatSender.ai,
      message:
          'Halo! Saya AI Health Assistant 🤖\n\n'
          'Saya bisa bantu jawab pertanyaan seputar kesehatan, jadwal, obat, '
          'hasil lab, hingga ringkasan rekam medis Anda. Ada yang bisa saya bantu?',
      timestamp: DateTime.now(),
    ),
  ];
  bool _isTyping = false;

  List<ChatMessageModel> get messages => _messages;
  bool get isTyping => _isTyping;

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    _messages.add(ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      sender: ChatSender.patient,
      message: text,
      timestamp: DateTime.now(),
    ));
    _isTyping = true;
    notifyListeners();

    final reply = await _service.sendMessage(text);
    _messages.add(reply);
    _isTyping = false;
    notifyListeners();
  }
}
