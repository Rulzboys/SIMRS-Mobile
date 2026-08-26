import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/queue_model.dart';
import '../common/custom_card.dart';

/// Kartu "Nomor Antrian Hari Ini" di Home Dashboard.
class QueueCard extends StatelessWidget {
  final QueueModel? queue;
  final VoidCallback? onTap;

  const QueueCard({super.key, this.queue, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (queue == null) {
      return CustomCard(
        onTap: onTap,
        child: const Text(
          'Belum ada antrian aktif hari ini.',
          style: AppTextStyles.body,
        ),
      );
    }

    final q = queue!;
    return CustomCard(
      onTap: onTap,
      color: AppColors.primary,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nomor Antrian Anda',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  q.myNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  q.clinicName,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Sedang Dilayani',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                q.currentlyServing,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Estimasi ${q.estimatedMinutes} menit',
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
