import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/routes/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../models/patient_model.dart';
import '../../providers/appointment_provider.dart';
import '../../providers/queue_provider.dart';
import '../../providers/pharmacy_provider.dart';
import '../../providers/billing_provider.dart';
import '../../providers/notification_provider.dart';
import '../../widgets/common/section_header.dart';
import '../../widgets/home/welcome_card.dart';
import '../../widgets/home/appointment_card.dart';
import '../../widgets/home/queue_card.dart';
import '../../widgets/home/health_summary_card.dart';
import '../../widgets/home/medication_card.dart';
import '../../widgets/home/billing_card.dart';
import '../../widgets/home/shortcut_grid.dart';

/// Home Dashboard — halaman inti aplikasi SIMRS AI Mobile (Patient).
/// Menampilkan seluruh ringkasan penting pasien dalam satu layar.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PatientModel _patient = PatientModel.dummy();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppointmentProvider>().loadAppointments();
      context.read<QueueProvider>().loadQueue();
      context.read<PharmacyProvider>().loadMedications();
      context.read<BillingProvider>().loadInvoices();
      context.read<NotificationProvider>().loadNotifications();
    });
  }

  Future<void> _refresh() async {
    await Future.wait([
      context.read<AppointmentProvider>().loadAppointments(),
      context.read<QueueProvider>().loadQueue(),
      context.read<PharmacyProvider>().loadMedications(),
      context.read<BillingProvider>().loadInvoices(),
      context.read<NotificationProvider>().loadNotifications(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final appointmentProvider = context.watch<AppointmentProvider>();
    final queueProvider = context.watch<QueueProvider>();
    final pharmacyProvider = context.watch<PharmacyProvider>();
    final billingProvider = context.watch<BillingProvider>();
    final notificationProvider = context.watch<NotificationProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _refresh,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            WelcomeCard(
              patientName: _patient.name,
              unreadNotification: notificationProvider.unreadCount,
              onNotificationTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.notification),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(title: 'Akses Cepat'),
                  const SizedBox(height: 12),
                  ShortcutGrid(items: [
                    ShortcutItem(
                      label: 'Booking',
                      icon: Icons.add_circle_outline,
                      onTap: () =>
                          Navigator.of(context).pushNamed(AppRoutes.booking),
                    ),
                    ShortcutItem(
                      label: 'AI Assistant',
                      icon: Icons.smart_toy_outlined,
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.aiAssistant),
                    ),
                    ShortcutItem(
                      label: 'Rekam Medis',
                      icon: Icons.folder_shared_outlined,
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.medicalRecord),
                    ),
                    ShortcutItem(
                      label: 'Konsultasi',
                      icon: Icons.chat_bubble_outline,
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.consultation),
                    ),
                    ShortcutItem(
                      label: 'Apotek',
                      icon: Icons.local_pharmacy_outlined,
                      onTap: () =>
                          Navigator.of(context).pushNamed(AppRoutes.pharmacy),
                    ),
                    ShortcutItem(
                      label: 'Lab',
                      icon: Icons.biotech_outlined,
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.laboratory),
                    ),
                    ShortcutItem(
                      label: 'Radiologi',
                      icon: Icons.radar_outlined,
                      onTap: () =>
                          Navigator.of(context).pushNamed(AppRoutes.radiology),
                    ),
                    ShortcutItem(
                      label: 'Tagihan',
                      icon: Icons.receipt_long_outlined,
                      onTap: () =>
                          Navigator.of(context).pushNamed(AppRoutes.billing),
                    ),
                  ]),
                  const SizedBox(height: 28),
                  const SectionHeader(title: 'Appointment Berikutnya'),
                  const SizedBox(height: 12),
                  AppointmentCard(
                    appointment: appointmentProvider.nextAppointment,
                    onTap: () =>
                        Navigator.of(context).pushNamed(AppRoutes.appointment),
                  ),
                  const SizedBox(height: 24),
                  const SectionHeader(title: 'Antrian Hari Ini'),
                  const SizedBox(height: 12),
                  QueueCard(
                    queue: queueProvider.queue,
                    onTap: () =>
                        Navigator.of(context).pushNamed(AppRoutes.queue),
                  ),
                  const SizedBox(height: 24),
                  HealthSummaryCard(patient: _patient),
                  const SizedBox(height: 24),
                  const SectionHeader(title: 'Obat Aktif'),
                  const SizedBox(height: 12),
                  MedicationSummaryCard(
                    medications: pharmacyProvider.medications,
                    onTap: () =>
                        Navigator.of(context).pushNamed(AppRoutes.pharmacy),
                  ),
                  const SizedBox(height: 24),
                  const SectionHeader(title: 'Tagihan'),
                  const SizedBox(height: 12),
                  BillingSummaryCard(
                    unpaidAmount: billingProvider.totalUnpaid,
                    onTap: () =>
                        Navigator.of(context).pushNamed(AppRoutes.billing),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
