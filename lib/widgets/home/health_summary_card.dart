import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/patient_model.dart';
import '../common/custom_card.dart';

/// Kartu "Ringkasan Kesehatan" (golongan darah, alergi, berat, tinggi).
class HealthSummaryCard extends StatelessWidget {
  final PatientModel patient;

  const HealthSummaryCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ringkasan Kesehatan', style: AppTextStyles.cardTitle),
          const SizedBox(height: 14),
          Row(
            children: [
              _SummaryItem(
                icon: Icons.bloodtype_outlined,
                label: 'Gol. Darah',
                value: patient.bloodType,
              ),
              _SummaryItem(
                icon: Icons.monitor_weight_outlined,
                label: 'Berat',
                value: '${patient.weightKg.toStringAsFixed(0)} kg',
              ),
              _SummaryItem(
                icon: Icons.height_outlined,
                label: 'Tinggi',
                value: '${patient.heightCm.toStringAsFixed(0)} cm',
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text('Riwayat Alergi', style: AppTextStyles.bodySmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: patient.allergies.isEmpty
                ? [const Text('Tidak ada data', style: AppTextStyles.bodySmall)]
                : patient.allergies
                    .map((a) => Chip(
                          label: Text(a),
                          backgroundColor: AppColors.dangerSoft,
                          labelStyle: const TextStyle(
                            color: AppColors.danger,
                            fontSize: 12,
                          ),
                          side: BorderSide.none,
                        ))
                    .toList(),
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _SummaryItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(height: 6),
          Text(value, style: AppTextStyles.cardTitle.copyWith(fontSize: 14)),
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
