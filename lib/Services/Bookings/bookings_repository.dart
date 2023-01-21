import 'bookings_service.dart';

import '/DTOs/Bookings/booking.dart';
import '/Models/Shared/message_exception.dart';

class BookingsRepository {
  late BookingsService _profileService;

  BookingsRepository() {
    _profileService = BookingsService.create();
  }

  Future<String> book(BookingDTO dto) async {
    final body = dto.toJson();
    final response = await _profileService.book(body);
    try {
      final url = response.body as String;
      return url;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }
}
