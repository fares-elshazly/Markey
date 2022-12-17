abstract class Urls {
  static const baseUrl = 'http://api.markey-eg.com';
  static const api = '$baseUrl/api';

  static const profile = '$baseUrl/view/profile';

  static String generateProfileLink(int userId) => '$profile/$userId';
}
