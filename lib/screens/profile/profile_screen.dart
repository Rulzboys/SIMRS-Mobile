import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/routes/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/patient_model.dart';
import '../../providers/auth_provider.dart';

/// Halaman profil pasien (biodata, BPJS, asuransi, emergency contact).
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final patient = PatientModel.dummy();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Profil Saya')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 44,
                  backgroundColor: AppColors.primarySoft,
                  child: Icon(Icons.person, size: 48, color: AppColors.primary),
                ),
                const SizedBox(height: 12),
                Text(patient.name, style: AppTextStyles.h3),
                const SizedBox(height: 4),
                Text('ID Pasien: ${patient.id}', style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _ProfileMenuGroup(
            title: 'Informasi Pribadi',
            items: [
              _ProfileMenuItem(
                icon: Icons.badge_outlined,
                label: 'Biodata',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.emergency_outlined,
                label: 'Kontak Darurat',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.health_and_safety_outlined,
                label: 'BPJS & Asuransi',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          _ProfileMenuGroup(
            title: 'Layanan',
            items: [
              _ProfileMenuItem(
                icon: Icons.folder_shared_outlined,
                label: 'Rekam Medis',
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.medicalRecord),
              ),
              _ProfileMenuItem(
                icon: Icons.receipt_long_outlined,
                label: 'Tagihan',
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.billing),
              ),
              _ProfileMenuItem(
                icon: Icons.notifications_outlined,
                label: 'Notifikasi',
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.notification),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _ProfileMenuGroup(
            title: 'Lainnya',
            items: [
              _ProfileMenuItem(
                icon: Icons.settings_outlined,
                label: 'Pengaturan',
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.settings),
              ),
              _ProfileMenuItem(
                icon: Icons.lock_outline,
                label: 'Ubah Password',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.logout,
                label: 'Keluar',
                color: AppColors.danger,
                onTap: () async {
                  await context.read<AuthProvider>().logout();
                  if (context.mounted) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.login,
                      (route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuGroup extends StatelessWidget {
  final String title;
  final List<_ProfileMenuItem> items;

  const _ProfileMenuGroup({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.bodySmall),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: items
                .map((item) => item)
                .expand((item) => [item, const Divider(height: 1)])
                .toList()
              ..removeLast(),
          ),
        ),
      ],
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const _ProfileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppColors.primary),
      title: Text(
        label,
        style: AppTextStyles.body.copyWith(color: color),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColors.textHint),
      onTap: onTap,
    );
  }
}
