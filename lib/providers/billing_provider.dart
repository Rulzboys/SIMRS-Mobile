import 'package:flutter/foundation.dart';
import '../models/invoice_model.dart';
import '../services/billing_service.dart';

/// Provider tagihan & pembayaran.
class BillingProvider extends ChangeNotifier {
  final BillingService _service = BillingService();

  List<InvoiceModel> _invoices = [];
  bool _isLoading = false;

  List<InvoiceModel> get invoices => _invoices;
  bool get isLoading => _isLoading;

  double get totalUnpaid => _invoices
      .where((e) => e.status == InvoiceStatus.unpaid)
      .fold(0, (sum, e) => sum + e.amount);

  Future<void> loadInvoices() async {
    _isLoading = true;
    notifyListeners();
    _invoices = await _service.getInvoices();
    _isLoading = false;
    notifyListeners();
  }
}
