import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedic_booking_app/data/repository/booking_repositary.dart';

import '../../data/models/booking_model.dart';


part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository repository;

  List<BookingModel> _allBookings = [];

  BookingBloc(this.repository) : super(BookingInitial()) {
    on<LoadBookings>(_onLoadBookings);
    on<SearchBookings>(_onSearchBookings);
    on<FilterBookings>(_onFilterBookings);
  }

  
  Future<void> _onLoadBookings(
    LoadBookings event,
    Emitter<BookingState> emit,
  ) async {
    try {
      emit(BookingLoading());

      _allBookings = await repository.getBookings();

      emit(BookingLoaded(_allBookings));
    } catch (e) {
      emit(
        BookingError(
          e.toString(),
        ),
      );
    }
  }

  void _onSearchBookings(
    SearchBookings event,
    Emitter<BookingState> emit,
  ) {
    final filtered = _allBookings.where((booking) {
      return booking.customerName
          .toLowerCase()
          .contains(
            event.query.toLowerCase(),
          );
    }).toList();

    emit(
      BookingLoaded(filtered),
    );
  }

  void _onFilterBookings(
    FilterBookings event,
    Emitter<BookingState> emit,
  ) {
    if (event.status == 'All') {
      emit(
        BookingLoaded(_allBookings),
      );
      return;
    }

    final filtered = _allBookings.where((booking) {
      return booking.status == event.status;
    }).toList();

    emit(
      BookingLoaded(filtered),
    );
  }
}
