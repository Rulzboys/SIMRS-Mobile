import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/date_formatter.dart';
import '../../models/medical_record_model.dart';
import '../../widgets/common/custom_card.dart';

/// Detail satu entri rekam medis.
class MedicalRecordDetailScreen extends StatelessWidget {
  final MedicalRecordModel record;

  const MedicalRecordDetailScreen({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Detail Rekam Medis')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(record.title, style: AppTextStyles.h3),
                const SizedBox(height: 6),
                Text(DateFormatter.full(record.date), style: AppTextStyles.bodySmall),
                const Divider(height: 28),
                _DetailRow(label: 'Dokter', value: record.doctorName),
                const SizedBox(height: 12),
                const Text('Catatan Medis', style: AppTextStyles.cardTitle),
                const SizedBox(height: 8),
                Text(record.description, style: AppTextStyles.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 100, child: Text(label, style: AppTextStyles.bodySmall)),
        Expanded(child: Text(value, style: AppTextStyles.body)),
      ],
    );
  }
}
