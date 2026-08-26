import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/common/custom_card.dart';

/// Daftar dokter untuk konsultasi online (chat, upload dokumen/lab).
class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  static const List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. Andi Saputra, Sp.PD',
      'specialty': 'Penyakit Dalam',
      'lastMessage': 'Baik, silakan kontrol kembali minggu depan.',
      'time': '10.24',
    },
    {
      'name': 'Dr. Maya Kusuma, Sp.A',
      'specialty': 'Anak',
      'lastMessage': 'Terima kasih atas fotonya, saya lihat dulu ya.',
      'time': 'Kemarin',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Konsultasi Online')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _doctors.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final doc = _doctors[index];
          return CustomCard(
            onTap: () => Navigator.of(context).pushNamed(
              AppRoutes.consultationChat,
              arguments: doc['name'],
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.primarySoft,
                  child: Icon(Icons.person, color: AppColors.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doc['name']!, style: AppTextStyles.cardTitle),
                      Text(doc['specialty']!, style: AppTextStyles.bodySmall),
                      const SizedBox(height: 4),
                      Text(
                        doc['lastMessage']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
                Text(doc['time']!, style: AppTextStyles.caption),
              ],
            ),
          );
        },
      ),
    );
  }
}
