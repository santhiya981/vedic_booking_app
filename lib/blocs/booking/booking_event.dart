part of 'booking_bloc.dart';

abstract class BookingEvent {}

class LoadBookings extends BookingEvent {}

class SearchBookings extends BookingEvent {
  final String query;

  SearchBookings(this.query);
}

class FilterBookings extends BookingEvent {
  final String status;

  FilterBookings(this.status);
}