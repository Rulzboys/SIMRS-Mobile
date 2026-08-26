import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/notification_model.dart';
import '../../providers/notification_provider.dart';
import '../../widgets/common/custom_card.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/common/loading_indicator.dart';

/// Daftar notifikasi aplikasi.
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationProvider>().loadNotifications();
    });
  }

  IconData _iconFor(NotificationType type) {
    switch (type) {
      case NotificationType.appointment:
        return Icons.event_outlined;
      case NotificationType.queue:
        return Icons.confirmation_number_outlined;
      case NotificationType.medicationReminder:
        return Icons.medication_outlined;
      case NotificationType.controlReminder:
        return Icons.alarm_outlined;
      case NotificationType.prescriptionReady:
        return Icons.local_pharmacy_outlined;
      case NotificationType.labResult:
        return Icons.biotech_outlined;
      case NotificationType.general:
        return Icons.notifications_outlined;
    }
  }

  String _timeAgo(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 60) return '${diff.inMinutes} menit lalu';
    if (diff.inHours < 24) return '${diff.inHours} jam lalu';
    return '${diff.inDays} hari lalu';
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NotificationProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Notifikasi')),
      body: provider.isLoading
          ? const LoadingIndicator()
          : provider.notifications.isEmpty
              ? const EmptyState(
                  title: 'Belum ada notifikasi',
                  icon: Icons.notifications_none_outlined,
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: provider.notifications.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final notif = provider.notifications[index];
                    return CustomCard(
                      color: notif.isRead ? AppColors.surface : AppColors.primarySoft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: AppColors.surface,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(_iconFor(notif.type),
                                color: AppColors.primary, size: 18),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(notif.title, style: AppTextStyles.cardTitle),
                                const SizedBox(height: 4),
                                Text(notif.message, style: AppTextStyles.bodySmall),
                                const SizedBox(height: 6),
                                Text(_timeAgo(notif.time), style: AppTextStyles.caption),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
