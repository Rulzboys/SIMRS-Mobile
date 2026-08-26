enum ChatSender { patient, doctor, ai }

/// Model pesan chat (konsultasi dokter maupun AI Assistant).
class ChatMessageModel {
  final String id;
  final ChatSender sender;
  final String message;
  final DateTime timestamp;
  final String? attachmentUrl;

  const ChatMessageModel({
    required this.id,
    required this.sender,
    required this.message,
    required this.timestamp,
    this.attachmentUrl,
  });
}
