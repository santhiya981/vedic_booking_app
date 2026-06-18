import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedic_booking_app/blocs/booking/booking_bloc.dart';
import 'package:vedic_booking_app/data/models/booking_model.dart';


import 'booking_details_screen.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  String selectedStatus = 'All';

  @override
  void initState() {
    super.initState();

    context.read<BookingBloc>().add(
      LoadBookings(),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;

      case 'Confirmed':
        return Colors.green;

      case 'Completed':
        return Colors.blue;

      default:
        return Colors.grey;
    }
  }

  Widget _buildBookingCard(
    BookingModel booking,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration:
                const Duration(milliseconds: 300),
            pageBuilder: (_, __, ___) =>
                BookingDetailsScreen(
              booking: booking,
            ),
            transitionsBuilder:
                (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                      const Color(0xFF5B21B6),
                  child: Text(
                    booking.customerName[0],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.customerName,
                        style:
                            const TextStyle(
                          fontWeight:
                              FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        booking.ritualName,
                        style:
                            const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(
                      booking.status,
                    ).withOpacity(0.15),
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Text(
                    booking.status,
                    style: TextStyle(
                      color: _getStatusColor(
                        booking.status,
                      ),
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                Text(
                  booking.date,
                ),
                Text(
                  booking.amount,
                  style:
                      const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(
    String status,
  ) {
    return ChoiceChip(
      label: Text(status),
      selected:
          selectedStatus == status,
      onSelected: (_) {
        setState(() {
          selectedStatus = status;
        });

        context
            .read<BookingBloc>()
            .add(
              FilterBookings(
                status,
              ),
            );
      },
    );
  }

  Widget _buildStatItem(
  String count,
  String label,
  Color color,
) {
  return Column(
    children: [
      Text(
        count,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5F5),

      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            const Color(0xFF5B21B6),
        title: const Text(
          'My Bookings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration:
                  InputDecoration(
                hintText:
                    'Search customer',
                prefixIcon:
                    const Icon(
                  Icons.search,
                ),
                filled: true,
                fillColor:
                    Colors.white,
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                  borderSide:
                      BorderSide.none,
                ),
              ),
              onChanged: (value) {
                context
                    .read<BookingBloc>()
                    .add(
                      SearchBookings(
                        value,
                      ),
                    );
              },
            ),

            const SizedBox(height: 16),
            Container(
  margin: const EdgeInsets.all(16),
  padding: const EdgeInsets.symmetric(
    vertical: 20,
    horizontal: 12,
  ),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade200,
        blurRadius: 4,
      ),
    ],
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _buildStatItem(
        "142",
        "Total",
        Colors.deepPurple,
      ),
      _buildStatItem(
        "8",
        "Pending",
        Colors.orange,
      ),
      _buildStatItem(
        "127",
        "Completed",
        Colors.green,
      ),
      _buildStatItem(
        "7",
        "Cancelled",
        Colors.red,
      ),
    ],
  ),
),

            SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(
                    'All',
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildFilterChip(
                    'Pending',
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildFilterChip(
                    'Confirmed',
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildFilterChip(
                    'Completed',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: BlocBuilder<
                  BookingBloc,
                  BookingState>(
                builder:
                    (context, state) {
                  if (state
                      is BookingLoading) {
                    return const Center(
                      child:
                          CircularProgressIndicator(),
                    );
                  }

                  if (state
                      is BookingError) {
                    return Center(
                      child: Text(
                        state.message,
                      ),
                    );
                  }

                  if (state
                      is BookingLoaded) {
                    if (state
                        .bookings
                        .isEmpty) {
                      return const Center(
                        child: Text(
                          'No bookings found',
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount:
                          state.bookings
                              .length,
                      itemBuilder:
                          (
                        context,
                        index,
                      ) {
                        return _buildBookingCard(
                          state.bookings[
                              index],
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}