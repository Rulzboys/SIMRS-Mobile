import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/date_formatter.dart';
import '../../providers/radiology_provider.dart';
import '../../widgets/common/custom_card.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/common/loading_indicator.dart';

/// Hasil radiologi dengan penjelasan AI dalam bahasa awam.
class RadiologyScreen extends StatefulWidget {
  const RadiologyScreen({super.key});

  @override
  State<RadiologyScreen> createState() => _RadiologyScreenState();
}

class _RadiologyScreenState extends State<RadiologyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RadiologyProvider>().loadResults();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RadiologyProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Hasil Radiologi')),
      body: provider.isLoading
          ? const LoadingIndicator()
          : provider.results.isEmpty
              ? const EmptyState(
                  title: 'Belum ada hasil radiologi',
                  subtitle: 'Hasil pemeriksaan radiologi akan tampil di sini.',
                  icon: Icons.radar_outlined,
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: provider.results.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final rad = provider.results[index];
                    return CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(rad.examType, style: AppTextStyles.cardTitle),
                          const SizedBox(height: 4),
                          Text(DateFormatter.full(rad.date), style: AppTextStyles.caption),
                          const SizedBox(height: 10),
                          Text('Laporan Radiolog', style: AppTextStyles.bodySmall),
                          const SizedBox(height: 4),
                          Text(rad.reportSummary, style: AppTextStyles.body),
                          if (rad.aiExplanation != null) ...[
                            const Divider(height: 24),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.smart_toy_outlined,
                                    size: 18, color: AppColors.primary),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    rad.aiExplanation!,
                                    style: AppTextStyles.bodySmall,
                                  ),
                                ),
                              ],
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
