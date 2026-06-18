import '../models/dashboard_stats_model.dart';
import '../models/booking_request_model.dart';

class DashboardRepository {

  Future<DashboardStatsModel> getStats() async {

    return DashboardStatsModel(
      totalBookings: 142,
      pending: 8,
      completed: 127,
      earnings: 84000,
    );
  }

  Future<List<BookingRequestModel>>
      getBookingRequests() async {

    await Future.delayed(
      const Duration(seconds: 2),
    );

    return [
      BookingRequestModel(
        customerName: "Rajesh Kumar",
        ritualName: "Ganesh Homam",
        status: "Pending",
        amount: "₹46,000",
      ),
      BookingRequestModel(
        customerName: "Priya Sharma",
        ritualName: "Satyanarayana Pooja",
        status: "Confirmed",
        amount: "₹12,500",
      ),
    ];
  }
}