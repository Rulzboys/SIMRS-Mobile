import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/routes/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/date_formatter.dart';
import '../../models/medical_record_model.dart';
import '../../providers/medical_record_provider.dart';
import '../../widgets/common/custom_card.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/common/loading_indicator.dart';

/// Daftar riwayat rekam medis pasien.
class MedicalRecordScreen extends StatefulWidget {
  const MedicalRecordScreen({super.key});

  @override
  State<MedicalRecordScreen> createState() => _MedicalRecordScreenState();
}

class _MedicalRecordScreenState extends State<MedicalRecordScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MedicalRecordProvider>().loadRecords();
    });
  }

  IconData _iconFor(MedicalRecordType type) {
    switch (type) {
      case MedicalRecordType.checkup:
        return Icons.health_and_safety_outlined;
      case MedicalRecordType.diagnosis:
        return Icons.description_outlined;
      case MedicalRecordType.surgery:
        return Icons.local_hospital_outlined;
      case MedicalRecordType.vaccine:
        return Icons.vaccines_outlined;
      case MedicalRecordType.allergy:
        return Icons.warning_amber_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MedicalRecordProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Rekam Medis')),
      body: provider.isLoading
          ? const LoadingIndicator()
          : provider.records.isEmpty
              ? const EmptyState(
                  title: 'Belum ada rekam medis',
                  subtitle: 'Riwayat berobat Anda akan tampil di sini.',
                  icon: Icons.folder_off_outlined,
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: provider.records.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final record = provider.records[index];
                    return CustomCard(
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRoutes.medicalRecordDetail,
                        arguments: record,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primarySoft,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(_iconFor(record.type), color: AppColors.primary),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(record.title, style: AppTextStyles.cardTitle),
                                Text(record.doctorName, style: AppTextStyles.bodySmall),
                                const SizedBox(height: 4),
                                Text(
                                  DateFormatter.full(record.date),
                                  style: AppTextStyles.caption,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: AppColors.textHint),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
