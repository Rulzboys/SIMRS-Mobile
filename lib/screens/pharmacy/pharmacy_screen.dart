import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/date_formatter.dart';
import '../../models/medication_model.dart';
import '../../providers/pharmacy_provider.dart';
import '../../widgets/common/custom_card.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/status_badge.dart';

/// E-Resep, status resep, tracking obat, dan QR pengambilan.
class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({super.key});

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PharmacyProvider>().loadMedications();
    });
  }

  StatusBadge _badgeFor(PrescriptionStatus status) {
    switch (status) {
      case PrescriptionStatus.processing:
        return StatusBadge.warning('Sedang Diproses');
      case PrescriptionStatus.ready:
        return StatusBadge.success('Siap Diambil');
      case PrescriptionStatus.taken:
        return StatusBadge.info('Sudah Diambil');
      case PrescriptionStatus.expired:
        return StatusBadge.danger('Kedaluwarsa');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PharmacyProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Apotek')),
      body: provider.isLoading
          ? const LoadingIndicator()
          : provider.medications.isEmpty
              ? const EmptyState(
                  title: 'Tidak ada e-resep',
                  subtitle: 'Resep dari dokter akan muncul di sini.',
                  icon: Icons.medication_outlined,
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: provider.medications.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final med = provider.medications[index];
                    return CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(med.name, style: AppTextStyles.cardTitle),
                              ),
                              _badgeFor(med.status),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(med.dosage, style: AppTextStyles.bodySmall),
                          const SizedBox(height: 4),
                          Text(med.instructions, style: AppTextStyles.caption),
                          const SizedBox(height: 8),
                          Text(
                            'Diresepkan ${DateFormatter.short(med.prescribedDate)}',
                            style: AppTextStyles.caption,
                          ),
                          if (med.status == PrescriptionStatus.ready) ...[
                            const SizedBox(height: 12),
                            OutlinedButton.icon(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text('QR Pengambilan Obat'),
                                    content: const Icon(Icons.qr_code_2,
                                        size: 160, color: AppColors.primary),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Tutup'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.qr_code, size: 18),
                              label: const Text('Tampilkan QR'),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
