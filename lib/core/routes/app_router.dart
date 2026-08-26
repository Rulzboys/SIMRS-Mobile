import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../screens/auth/splash_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/main_navigation.dart';
import '../../screens/appointment/appointment_screen.dart';
import '../../screens/appointment/doctor_search_screen.dart';
import '../../screens/appointment/booking_screen.dart';
import '../../screens/appointment/appointment_history_screen.dart';
import '../../screens/queue/queue_screen.dart';
import '../../screens/medical_record/medical_record_screen.dart';
import '../../screens/medical_record/medical_record_detail_screen.dart';
import '../../screens/consultation/consultation_screen.dart';
import '../../screens/consultation/chat_screen.dart';
import '../../screens/ai_assistant/ai_assistant_screen.dart';
import '../../screens/pharmacy/pharmacy_screen.dart';
import '../../screens/laboratory/laboratory_screen.dart';
import '../../screens/radiology/radiology_screen.dart';
import '../../screens/billing/billing_screen.dart';
import '../../screens/notification/notification_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/settings/settings_screen.dart';
import '../../models/medical_record_model.dart';

/// Generator route terpusat untuk seluruh aplikasi.
class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _page(const SplashScreen());
      case AppRoutes.login:
        return _page(const LoginScreen());
      case AppRoutes.main:
        return _page(const MainNavigation());

      case AppRoutes.appointment:
        return _page(const AppointmentScreen());
      case AppRoutes.doctorSearch:
        return _page(const DoctorSearchScreen());
      case AppRoutes.booking:
        return _page(const BookingScreen());
      case AppRoutes.appointmentHistory:
        return _page(const AppointmentHistoryScreen());

      case AppRoutes.queue:
        return _page(const QueueScreen());

      case AppRoutes.medicalRecord:
        return _page(const MedicalRecordScreen());
      case AppRoutes.medicalRecordDetail:
        final record = settings.arguments as MedicalRecordModel;
        return _page(MedicalRecordDetailScreen(record: record));

      case AppRoutes.consultation:
        return _page(const ConsultationScreen());
      case AppRoutes.consultationChat:
        final doctorName = settings.arguments as String? ?? 'Dokter';
        return _page(ChatScreen(doctorName: doctorName));

      case AppRoutes.aiAssistant:
        return _page(const AiAssistantScreen());

      case AppRoutes.pharmacy:
        return _page(const PharmacyScreen());

      case AppRoutes.laboratory:
        return _page(const LaboratoryScreen());

      case AppRoutes.radiology:
        return _page(const RadiologyScreen());

      case AppRoutes.billing:
        return _page(const BillingScreen());

      case AppRoutes.notification:
        return _page(const NotificationScreen());

      case AppRoutes.profile:
        return _page(const ProfileScreen());
      case AppRoutes.settings:
        return _page(const SettingsScreen());

      default:
        return _page(
          Scaffold(
            body: Center(
              child: Text('Halaman "${settings.name}" tidak ditemukan'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _page(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
