import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/date_formatter.dart';
import '../../models/appointment_model.dart';
import '../common/custom_card.dart';

/// Kartu "Appointment Berikutnya" di Home Dashboard.
class AppointmentCard extends StatelessWidget {
  final AppointmentModel? appointment;
  final VoidCallback? onTap;

  const AppointmentCard({super.key, this.appointment, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (appointment == null) {
      return CustomCard(
        onTap: onTap,
        child: const Row(
          children: [
            Icon(Icons.event_available_outlined, color: AppColors.primary),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Belum ada jadwal appointment. Yuk booking sekarang!',
                style: AppTextStyles.body,
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.textHint),
          ],
        ),
      );
    }

    final appt = appointment!;
    return CustomCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.medical_services_outlined, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appt.doctorName, style: AppTextStyles.cardTitle),
                const SizedBox(height: 2),
                Text(appt.specialty, style: AppTextStyles.bodySmall),
                const SizedBox(height: 6),
                Text(
                  '${DateFormatter.relativeDay(appt.dateTime)} • ${DateFormatter.time(appt.dateTime)}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textHint),
        ],
      ),
    );
  }
}
