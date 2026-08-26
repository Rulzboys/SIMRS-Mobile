import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/currency_formatter.dart';
import '../common/custom_card.dart';

/// Kartu "Tagihan" di Home Dashboard.
class BillingSummaryCard extends StatelessWidget {
  final double unpaidAmount;
  final VoidCallback? onTap;

  const BillingSummaryCard({
    super.key,
    required this.unpaidAmount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasUnpaid = unpaidAmount > 0;
    return CustomCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: hasUnpaid ? AppColors.warningSoft : AppColors.successSoft,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              Icons.receipt_long_outlined,
              color: hasUnpaid ? AppColors.warning : AppColors.success,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hasUnpaid ? 'Belum Dibayar' : 'Tidak Ada Tagihan',
                  style: AppTextStyles.bodySmall,
                ),
                const SizedBox(height: 2),
                Text(
                  hasUnpaid ? CurrencyFormatter.format(unpaidAmount) : 'Lunas',
                  style: AppTextStyles.cardTitle,
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textHint),
        ],
      ),
    );
  }
}
