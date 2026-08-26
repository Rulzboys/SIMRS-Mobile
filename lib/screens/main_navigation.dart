import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bottom_nav_provider.dart';
import '../widgets/navigation/main_bottom_nav_bar.dart';
import 'home/home_screen.dart';
import 'appointment/appointment_screen.dart';
import 'queue/queue_screen.dart';
import 'ai_assistant/ai_assistant_screen.dart';
import 'profile/profile_screen.dart';

/// Kerangka navigasi utama dengan BottomNavigationBar (5 menu inti).
/// Menu lain (Medical Record, Consultation, Pharmacy, dst) diakses lewat
/// shortcut di Home atau dari halaman Profile.
class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  static const List<Widget> _pages = [
    HomeScreen(),
    AppointmentScreen(),
    QueueScreen(),
    AiAssistantScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<BottomNavProvider>();

    return Scaffold(
      body: IndexedStack(
        index: navProvider.currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: MainBottomNavBar(
        currentIndex: navProvider.currentIndex,
        onTap: (index) => context.read<BottomNavProvider>().setIndex(index),
      ),
    );
  }
}
