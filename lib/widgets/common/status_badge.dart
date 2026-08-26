import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// Badge status kecil (mis. "Selesai", "Diproses", "Belum Dibayar").
class StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  final Color backgroundColor;

  const StatusBadge({
    super.key,
    required this.label,
    required this.color,
    required this.backgroundColor,
  });

  factory StatusBadge.success(String label) => StatusBadge(
        label: label,
        color: AppColors.success,
        backgroundColor: AppColors.successSoft,
      );

  factory StatusBadge.warning(String label) => StatusBadge(
        label: label,
        color: AppColors.warning,
        backgroundColor: AppColors.warningSoft,
      );

  factory StatusBadge.danger(String label) => StatusBadge(
        label: label,
        color: AppColors.danger,
        backgroundColor: AppColors.dangerSoft,
      );

  factory StatusBadge.info(String label) => StatusBadge(
        label: label,
        color: AppColors.info,
        backgroundColor: AppColors.infoSoft,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
