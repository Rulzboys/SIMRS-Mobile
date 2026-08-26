import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../providers/theme_provider.dart';

/// Pengaturan aplikasi: dark mode, bahasa, Face ID, fingerprint, logout.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _faceId = false;
  bool _fingerprint = true;
  String _language = 'Bahasa Indonesia';

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Pengaturan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SettingsSection(
            title: 'Tampilan',
            children: [
              SwitchListTile(
                value: themeProvider.isDarkMode,
                onChanged: (value) => themeProvider.toggleDarkMode(value),
                activeColor: AppColors.primary,
                title: const Text('Mode Gelap', style: AppTextStyles.body),
                secondary: const Icon(Icons.dark_mode_outlined, color: AppColors.primary),
              ),
              ListTile(
                leading: const Icon(Icons.language_outlined, color: AppColors.primary),
                title: const Text('Bahasa', style: AppTextStyles.body),
                trailing: Text(_language, style: AppTextStyles.bodySmall),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SettingsSection(
            title: 'Keamanan',
            children: [
              SwitchListTile(
                value: _faceId,
                onChanged: (value) => setState(() => _faceId = value),
                activeColor: AppColors.primary,
                title: const Text('Face ID', style: AppTextStyles.body),
                secondary: const Icon(Icons.face_outlined, color: AppColors.primary),
              ),
              SwitchListTile(
                value: _fingerprint,
                onChanged: (value) => setState(() => _fingerprint = value),
                activeColor: AppColors.primary,
                title: const Text('Fingerprint', style: AppTextStyles.body),
                secondary: const Icon(Icons.fingerprint, color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SettingsSection(
            title: 'Akun',
            children: [
              ListTile(
                leading: const Icon(Icons.logout, color: AppColors.danger),
                title: const Text('Keluar',
                    style: TextStyle(color: AppColors.danger)),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({required this.title, required this.children});

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
          child: Column(children: children),
        ),
      ],
    );
  }
}
