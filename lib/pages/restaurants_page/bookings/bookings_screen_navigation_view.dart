import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itable_app/pages/restaurants_page/bookings/bookings_screen_navigation_model.dart';
import 'package:itable_app/pages/restaurants_page/bookings/bookings_screen_navigation_viewmodel.dart';

class BookingsScreenNavigationView extends ConsumerWidget {
  const BookingsScreenNavigationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookings = ref.watch(bookingsViewModelProvider);
    ref.read(bookingsViewModelProvider.notifier).fetchBookings();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
      ),
      body: bookings.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator()) // Exibe um loader enquanto os dados são carregados
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return BookingCard(booking: booking);
              },
            ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final BookingsModel booking;

  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurante: ${booking.restaurantName}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text('Mesa: ${booking.restaurantTable}'),
            Text('Data: ${booking.dateTime}'),
            Text('Número de pessoas: ${booking.numberPeople}'),
            Text('Número do pedido: ${booking.orderNumber}'),
            Text('Status: ${booking.status}'),
          ],
        ),
      ),
    );
  }
}
