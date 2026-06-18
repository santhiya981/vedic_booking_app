import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedic_booking_app/data/repository/booking_repositary.dart';

import 'features/splash/presentation/splash_screen.dart';
import 'blocs/booking/booking_bloc.dart';

// 1. Declare a global ValueNotifier for theme tracking
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BookingBloc(
            BookingRepository(),
          ),
        ),
      ],
      // 2. Wrap your MaterialApp with a ValueListenableBuilder to listen for theme changes
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // 3. Define basic light and dark themes using default Material 3 settings
            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
            ),
            themeMode: currentMode, // 4. Bind the current mode here
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}