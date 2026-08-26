import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/medication_model.dart';
import '../common/custom_card.dart';

/// Kartu "Obat Aktif" di Home Dashboard.
class MedicationSummaryCard extends StatelessWidget {
  final List<MedicationModel> medications;
  final VoidCallback? onTap;

  const MedicationSummaryCard({
    super.key,
    required this.medications,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Obat Aktif', style: AppTextStyles.cardTitle),
              const Icon(Icons.chevron_right, color: AppColors.textHint),
            ],
          ),
          const SizedBox(height: 10),
          if (medications.isEmpty)
            const Text('Tidak ada obat aktif saat ini', style: AppTextStyles.bodySmall)
          else
            ...medications.take(3).map(
                  (m) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.medication_outlined,
                            color: AppColors.accent, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(m.name, style: AppTextStyles.body),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
