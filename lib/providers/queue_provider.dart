import 'package:flutter/foundation.dart';
import '../models/queue_model.dart';
import '../services/queue_service.dart';

/// Provider antrian pasien hari ini.
class QueueProvider extends ChangeNotifier {
  final QueueService _service = QueueService();

  QueueModel? _queue;
  bool _isLoading = false;

  QueueModel? get queue => _queue;
  bool get isLoading => _isLoading;

  Future<void> loadQueue() async {
    _isLoading = true;
    notifyListeners();
    _queue = await _service.getCurrentQueue();
    _isLoading = false;
    notifyListeners();
  }
}
