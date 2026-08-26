import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/utils/date_formatter.dart';
import '../../models/invoice_model.dart';
import '../../providers/billing_provider.dart';
import '../../widgets/common/custom_card.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/status_badge.dart';

/// Invoice, riwayat tagihan, dan pembayaran.
class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BillingProvider>().loadInvoices();
    });
  }

  StatusBadge _badgeFor(InvoiceStatus status) {
    switch (status) {
      case InvoiceStatus.unpaid:
        return StatusBadge.warning('Belum Dibayar');
      case InvoiceStatus.paid:
        return StatusBadge.success('Lunas');
      case InvoiceStatus.pending:
        return StatusBadge.info('Menunggu Verifikasi');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BillingProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Tagihan & Pembayaran')),
      body: provider.isLoading
          ? const LoadingIndicator()
          : provider.invoices.isEmpty
              ? const EmptyState(
                  title: 'Tidak ada tagihan',
                  subtitle: 'Riwayat tagihan Anda akan tampil di sini.',
                  icon: Icons.receipt_long_outlined,
                )
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Belum Dibayar',
                            style: TextStyle(color: Colors.white70, fontSize: 13),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            CurrencyFormatter.format(provider.totalUnpaid),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Riwayat Tagihan', style: AppTextStyles.cardTitle),
                    const SizedBox(height: 12),
                    ...provider.invoices.map(
                      (inv) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CustomCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(inv.description,
                                        style: AppTextStyles.cardTitle),
                                  ),
                                  _badgeFor(inv.status),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(DateFormatter.short(inv.date),
                                  style: AppTextStyles.caption),
                              const SizedBox(height: 8),
                              Text(
                                CurrencyFormatter.format(inv.amount),
                                style: AppTextStyles.h3,
                              ),
                              if (inv.status == InvoiceStatus.unpaid) ...[
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Bayar Sekarang'),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
