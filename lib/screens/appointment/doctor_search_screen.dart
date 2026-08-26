import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/common/custom_card.dart';

/// Pencarian rumah sakit, klinik/poli, dan dokter.
class DoctorSearchScreen extends StatefulWidget {
  const DoctorSearchScreen({super.key});

  @override
  State<DoctorSearchScreen> createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  final List<Map<String, String>> _doctors = const [
    {
      'name': 'Dr. Andi Saputra, Sp.PD',
      'specialty': 'Penyakit Dalam',
      'hospital': 'RS Sehat Sentosa',
      'schedule': 'Senin - Jumat, 08.00 - 12.00',
    },
    {
      'name': 'Dr. Maya Kusuma, Sp.A',
      'specialty': 'Anak',
      'hospital': 'RS Sehat Sentosa',
      'schedule': 'Senin, Rabu, Jumat, 13.00 - 16.00',
    },
    {
      'name': 'Dr. Budi Hartono, Sp.THT',
      'specialty': 'THT',
      'hospital': 'RS Sehat Sentosa',
      'schedule': 'Selasa, Kamis, 09.00 - 12.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Cari Dokter')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari nama dokter, poli, atau rumah sakit',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.surfaceMuted,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              itemCount: _doctors.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final doc = _doctors[index];
                return CustomCard(
                  onTap: () => Navigator.of(context)
                      .pushNamed('/appointment/booking', arguments: doc),
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
                            Text(doc['hospital']!,
                                style: const TextStyle(
                                    fontSize: 12, color: AppColors.primary)),
                            Text(doc['schedule']!, style: AppTextStyles.caption),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: AppColors.textHint),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
