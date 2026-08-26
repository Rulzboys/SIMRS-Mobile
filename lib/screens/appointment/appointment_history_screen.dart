import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/date_formatter.dart';
import '../../models/appointment_model.dart';
import '../../providers/appointment_provider.dart';
import '../../widgets/common/custom_card.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/status_badge.dart';

/// Riwayat seluruh appointment (selesai & dibatalkan).
class AppointmentHistoryScreen extends StatefulWidget {
  const AppointmentHistoryScreen({super.key});

  @override
  State<AppointmentHistoryScreen> createState() => _AppointmentHistoryScreenState();
}

class _AppointmentHistoryScreenState extends State<AppointmentHistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppointmentProvider>().loadAppointments();
    });
  }

  StatusBadge _badgeFor(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.completed:
        return StatusBadge.success('Selesai');
      case AppointmentStatus.cancelled:
        return StatusBadge.danger('Dibatalkan');
      case AppointmentStatus.upcoming:
        return StatusBadge.info('Terjadwal');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppointmentProvider>();
    final history = provider.appointments
        .where((a) => a.status != AppointmentStatus.upcoming)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Riwayat Appointment')),
      body: provider.isLoading
          ? const LoadingIndicator()
          : history.isEmpty
              ? const EmptyState(
                  title: 'Belum ada riwayat',
                  subtitle: 'Riwayat appointment Anda akan muncul di sini.',
                  icon: Icons.history,
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: history.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final appt = history[index];
                    return CustomCard(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(appt.doctorName, style: AppTextStyles.cardTitle),
                                Text(appt.specialty, style: AppTextStyles.bodySmall),
                                const SizedBox(height: 6),
                                Text(
                                  DateFormatter.full(appt.dateTime),
                                  style: AppTextStyles.caption,
                                ),
                              ],
                            ),
                          ),
                          _badgeFor(appt.status),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
