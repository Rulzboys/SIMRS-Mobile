import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../providers/queue_provider.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/loading_indicator.dart';

/// Halaman antrian real-time dengan QR check-in.
class QueueScreen extends StatefulWidget {
  const QueueScreen({super.key});

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QueueProvider>().loadQueue();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QueueProvider>();
    final queue = provider.queue;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Antrian Saya')),
      body: provider.isLoading
          ? const LoadingIndicator()
          : queue == null
              ? const Center(child: Text('Belum ada antrian aktif'))
              : RefreshIndicator(
                  onRefresh: () => provider.loadQueue(),
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 36),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Nomor Antrian Anda',
                              style: TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              queue.myNumber,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 56,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              queue.clinicName,
                              style: const TextStyle(color: Colors.white70, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: _InfoTile(
                              label: 'Sedang Dilayani',
                              value: queue.currentlyServing,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _InfoTile(
                              label: 'Estimasi Waktu',
                              value: '${queue.estimatedMinutes} menit',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _InfoTile(
                        label: 'Posisi Anda dalam Antrian',
                        value: '${queue.positionAhead} orang di depan Anda',
                        fullWidth: true,
                      ),
                      const SizedBox(height: 28),
                      CustomButton(
                        label: 'QR Check-In',
                        icon: Icons.qr_code_scanner,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => Padding(
                              padding: const EdgeInsets.all(32),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.qr_code_2, size: 140, color: AppColors.primary),
                                  SizedBox(height: 16),
                                  Text(
                                    'Tunjukkan QR ini di meja registrasi',
                                    style: AppTextStyles.body,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final bool fullWidth;

  const _InfoTile({
    required this.label,
    required this.value,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.bodySmall),
          const SizedBox(height: 6),
          Text(value, style: AppTextStyles.cardTitle),
        ],
      ),
    );
  }
}
