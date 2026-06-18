import 'package:flutter/material.dart';
import 'package:vedic_booking_app/data/models/booking_model.dart';

class BookingDetailsScreen extends StatelessWidget {
  final BookingModel booking;

  const BookingDetailsScreen({
    super.key,
    required this.booking,
  });

  Widget buildSectionCard({
    required String title,
    required Widget child,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5B21B6),
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  Widget detailRow(
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5F5),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.fromLTRB(
                20,
                50,
                20,
                25,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF5B21B6),
                borderRadius:
                    BorderRadius.only(
                  bottomLeft:
                      Radius.circular(25),
                  bottomRight:
                      Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    booking.id,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    booking.ritualName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration:
                        BoxDecoration(
                      color:
                          Colors.amber.shade100,
                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: const Text(
                      "Awaiting Confirmation",
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green,
                          ),
                          child: const Text(
                            "Accept",
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 12,
                      ),

                      Expanded(
                        child:
                            OutlinedButton(
                          onPressed: () {},
                          style:
                              OutlinedButton.styleFrom(
                            side:
                                const BorderSide(
                              color:
                                  Colors.red,
                            ),
                          ),
                          child: const Text(
                            "Decline",
                            style: TextStyle(
                              color:
                                  Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(16),
              child: Column(
                children: [
                  // CUSTOMER DETAILS
                  buildSectionCard(
                    title:
                        "Customer Details",
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor:
                              const Color(
                            0xFF5B21B6,
                          ),
                          child: Text(
                            booking
                                .customerName[0],
                            style:
                                const TextStyle(
                              color:
                                  Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 16,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              Text(
                                booking
                                    .customerName,
                                style:
                                    const TextStyle(
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                booking.phone,
                              ),
                              Text(
                                booking.address,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // BOOKING INFO
                  buildSectionCard(
                    title:
                        "Booking Information",
                    child: Column(
                      children: [
                        detailRow(
                          "Booking ID",
                          booking.id,
                        ),
                        detailRow(
                          "Date",
                          booking.date,
                        ),
                        detailRow(
                          "Time",
                          booking.time,
                        ),
                        detailRow(
                          "Status",
                          booking.status,
                        ),
                        detailRow(
                          "Service",
                          booking.ritualName,
                        ),
                      ],
                    ),
                  ),

                  // PAYMENT
                  buildSectionCard(
                    title:
                        "Payment Summary",
                    child: Column(
                      children: [
                        detailRow(
                          "Service Fee",
                          booking.amount,
                        ),
                        detailRow(
                          "Platform Fee",
                          "₹4,000",
                        ),
                        detailRow(
                          "GST",
                          "₹2,000",
                        ),

                        const Divider(),

                        Align(
                          alignment:
                              Alignment.centerRight,
                          child: Text(
                            booking.amount,
                            style:
                                const TextStyle(
                              fontSize: 28,
                              color:
                                  Color(
                                0xFF5B21B6,
                              ),
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SPECIAL INSTRUCTIONS
                  buildSectionCard(
                    title:
                        "Special Instructions",
                    child: Text(
                      booking.instructions,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}