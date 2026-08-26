import 'package:intl/intl.dart';

/// Helper format mata uang Rupiah.
class CurrencyFormatter {
  CurrencyFormatter._();

  static final NumberFormat _rupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  static String format(num amount) => _rupiah.format(amount);
}
