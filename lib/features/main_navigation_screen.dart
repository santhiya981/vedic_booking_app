import 'package:flutter/material.dart';
import 'package:vedic_booking_app/features/booking/presentation/my_booking_screen.dart';
import 'package:vedic_booking_app/features/dashboard/presentation/dashboard_screen.dart';



class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {

  int selectedIndex = 0;

  final List<Widget> screens = [
    const DashboardScreen(),
    const MyBookingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Bookings",
          ),
        ],
      ),
    );
  }
}