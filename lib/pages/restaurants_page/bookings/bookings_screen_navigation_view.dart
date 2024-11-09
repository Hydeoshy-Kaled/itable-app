// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:itable_app/pages/restaurants_page/bookings/bookings_screen_navigation_viewmodel.dart';

// class BookingsScreenNavigationView extends ConsumerWidget {
//   const BookingsScreenNavigationView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {

//     final bookings = ref.watch(bookingsViewModelProvider);
//     ref.read(bookingsViewModelProvider.notifier).fetchBookings();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Bookings'),
//       ),
//        body: bookings.isEmpty
//           ? const Center(child: CircularProgressIndicator()) // Exibe um loader enquanto os dados são carregados
//           : ListView.builder(
//               itemCount: bookings.length,
//               itemBuilder: (context, index) {
//                 final booking = bookings[index];
//                 return BookingCard(booking: booking);
//               },
//             ),
//     );
//   }
// }
