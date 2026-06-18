import '../models/booking_model.dart';

class BookingRepository {
  Future<List<BookingModel>> getBookings() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return [
      BookingModel(
        id: 'BK001',
        customerName: 'Rajesh Kumar',
        ritualName: 'Ganesh Homam',
        status: 'Pending',
        amount: '₹46,000',
        phone: '9876543210',
        address: 'Chennai',
        date: '06 May 2025',
        time: '10:30 AM',
        instructions: 'Bring flowers and coconut',
      ),
      BookingModel(
        id: 'BK002',
        customerName: 'Priya Sharma',
        ritualName: 'Satyanarayana Pooja',
        status: 'Confirmed',
        amount: '₹12,500',
        phone: '9876543211',
        address: 'Coimbatore',
        date: '08 May 2025',
        time: '09:00 AM',
        instructions: 'Need extra seating',
      ),
      BookingModel(
        id: 'BK003',
        customerName: 'Arun Kumar',
        ritualName: 'Gruhapravesam',
        status: 'Completed',
        amount: '₹18,000',
        phone: '9876543212',
        address: 'Madurai',
        date: '10 May 2025',
        time: '08:00 AM',
        instructions: 'None',
      ),
    ];
  }
}