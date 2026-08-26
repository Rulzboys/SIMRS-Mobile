import '../models/notification_model.dart';
import 'api_service.dart';

/// Service notifikasi aplikasi.
class NotificationService extends ApiService {
  Future<List<NotificationModel>> getNotifications() async {
    await simulateDelay();
    return NotificationModel.dummyList();
  }
}
