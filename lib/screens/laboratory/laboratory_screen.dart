import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/date_formatter.dart';
import '../../providers/laboratory_provider.dart';
import '../../widgets/common/custom_card.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/status_badge.dart';

/// Hasil laboratorium dengan ringkasan AI.
class LaboratoryScreen extends StatefulWidget {
  const LaboratoryScreen({super.key});

  @override
  State<LaboratoryScreen> createState() => _LaboratoryScreenState();
}

class _LaboratoryScreenState extends State<LaboratoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LaboratoryProvider>().loadResults();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LaboratoryProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Hasil Laboratorium')),
      body: provider.isLoading
          ? const LoadingIndicator()
          : provider.results.isEmpty
              ? const EmptyState(
                  title: 'Belum ada hasil lab',
                  subtitle: 'Hasil pemeriksaan laboratorium akan tampil di sini.',
                  icon: Icons.biotech_outlined,
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: provider.results.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final lab = provider.results[index];
                    return CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(lab.testName, style: AppTextStyles.cardTitle),
                              ),
                              lab.isAbnormal
                                  ? StatusBadge.warning('Perlu Perhatian')
                                  : StatusBadge.success('Normal'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '${lab.value} ${lab.unit}',
                                style: AppTextStyles.h3.copyWith(
                                  color: lab.isAbnormal
                                      ? AppColors.warning
                                      : AppColors.success,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text('Normal: ${lab.normalRange}',
                                  style: AppTextStyles.caption),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(DateFormatter.short(lab.date), style: AppTextStyles.caption),
                          if (lab.aiSummary != null) ...[
                            const Divider(height: 24),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.smart_toy_outlined,
                                    size: 18, color: AppColors.primary),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    lab.aiSummary!,
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
