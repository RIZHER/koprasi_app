import 'package:intl/intl.dart';

class CurrencyFormatter {
  // Fungsi untuk format uang dalam format IDR (Indonesia Rupiah)
  static String formatRupiah(int amount) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
    return formatCurrency.format(amount);
  }
}
