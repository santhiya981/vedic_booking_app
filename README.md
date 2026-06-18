# Vedic Booking App - Flutter Assessment

A scalable, production-ready Flutter application implementing the core booking workflow for Vedic providers. This app uses a clean, feature-driven architecture paired with robust state management to handle complex UI layouts and state transitions cleanly.

---

## 🚀 Implemented Features & Screens

1. **Splash Screen:** Animated entry screen featuring a gradient background, logo, and automatic routing.
2. **Home Dashboard:** Displays booking statistics cards, upcoming ritual data, and a live-updating recent booking requests list.
3. **My Bookings (Primary Screen):** Full booking management interface supporting real-time local search filter by customer name and dynamic tab status filtering (Pending, Confirmed, Completed).
4. **Booking Details:** Detailed view presenting customer details, booking information, payment summaries, and special instructions.

---

## 🛠️ Architecture & Tech Stack

- **State Management:** `Bloc` pattern used to ensure absolute separation of UI layout from underlying business logic.
- **Folder Structure:** Feature-Based pattern (`features/splash`, `features/dashboard`, `blocs/booking`, etc.) making the codebase highly scalable and collaborative.
- **Data Layer:** Implemented utilizing the Repository Pattern to mock and manipulate domain model classes efficiently.
- **UI Design:** Leveraged custom component isolation (Reusable Widgets) to keep presentation files clean, maintainable, and highly responsive.

---

## ⏱️ Scope Reductions & Production Enhancements


- **Ritual Verification & Completion (Screens 5 & 6):** Due to strict time constraints, the multi-step OTP validation and live timer screens were deferred. The application architecture is configured to seamlessly append these presentation states to the existing Bloc layer in a future milestone.
- **Local Storage Persistence:** State updates currently live directly within the reactive Bloc memory scope for seamless presentation during runtime testing. For a production release, an offline client like `Hive`, `Isar`, or `hydrated_bloc` would be injected directly into the `BookingRepository` to preserve status mappings permanently across app restarts.
- **Theme Adaptability:** The codebase sets up the infrastructure for `ThemeMode.light` and `ThemeMode.dark` via a global notifier structure within `main.dart`. To exactly match the complex layout mockups under tight delivery pressure, hardcoded hex values were preferred over abstract semantic tokens (`Theme.of(context).colorScheme`). Full color token binding would be implemented next.

---

## 🏃‍♂️ Getting Started & Running the Project

### Prerequisites
- Flutter SDK (Latest Stable Channel)
- Android SDK / Emulator configured
