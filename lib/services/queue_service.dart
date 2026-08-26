import '../models/queue_model.dart';
import 'api_service.dart';

/// Service antrian real-time.
class QueueService extends ApiService {
  Future<QueueModel> getCurrentQueue() async {
    await simulateDelay();
    return QueueModel.dummy();
  }

  Future<void> checkIn(String qrCode) async {
    await simulateDelay();
    // TODO: kirim check-in ke backend.
  }
}
