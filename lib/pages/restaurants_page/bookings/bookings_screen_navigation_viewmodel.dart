import 'package:itable_app/auth/auth_app_engine.dart';
import 'package:itable_app/pages/restaurants_page/bookings/bookings_screen_navigation_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingsViewModelProvider = StateNotifierProvider<
    BookingsScreenNavigationViewModel, List<BookingsModel>>((ref) {
  return BookingsScreenNavigationViewModel(AuthAppEngine());
});

class BookingsScreenNavigationViewModel
    extends StateNotifier<List<BookingsModel>> {
  final AuthAppEngine _authAppEngine;

  BookingsScreenNavigationViewModel(this._authAppEngine) : super([]);

  Future<void> fetchBookings() async {
    try {
      final response = await _authAppEngine.fetchData('/reservations');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        state = data.map((item) => BookingsModel.fromJson(item)).toList();
      } else {
        throw Exception('Falha ao carregar as reservas');
      }
    } catch (error) {
      print('Erro ao carregar as reservas: $error');
      rethrow;
    }
  }
}
