class BookingModel {
  final String id;
  final String customerName;
  final String ritualName;
  final String status;
  final String amount;
  final String phone;
  final String address;
  final String date;
  final String time;
  final String instructions;

  BookingModel({
    required this.id,
    required this.customerName,
    required this.ritualName,
    required this.status,
    required this.amount,
    required this.phone,
    required this.address,
    required this.date,
    required this.time,
    required this.instructions,
  });
}