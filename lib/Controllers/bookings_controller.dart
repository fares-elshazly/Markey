import 'package:get/get.dart';

import '/DTOs/Bookings/booking.dart';
import '/Services/Bookings/bookings_repository.dart';

class BookingsController extends GetxController {
  late BookingsRepository _repository;

  BookingsController() {
    _repository = BookingsRepository();
  }

  Future<String> book(BookingDTO dto) async {
    try {
      final url = await _repository.book(dto);
      return url;
    } catch (error) {
      rethrow;
    }
  }
}
