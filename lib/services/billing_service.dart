import '../models/invoice_model.dart';
import 'api_service.dart';

/// Service tagihan & pembayaran.
class BillingService extends ApiService {
  Future<List<InvoiceModel>> getInvoices() async {
    await simulateDelay();
    return InvoiceModel.dummyList();
  }

  Future<void> payInvoice(String invoiceId) async {
    await simulateDelay();
    // TODO: integrasikan payment gateway.
  }
}
