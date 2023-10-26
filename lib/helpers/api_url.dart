class ApiUrl {
  static const String baseUrl = 'https://responsi1b.dalhaqq.xyz/api';

  static const String listTugas = '$baseUrl/assignments';
  static const String createTugas = '$baseUrl/assignments';

  static String updateTugas(int id) {
    return '$baseUrl/assignments/$id/update';
  }

  static String showTugas(int id) {
    return '$baseUrl/assignments/$id';
  }

  static String deleteTugas(int id) {
    return '$baseUrl/assignments/$id/delete';
  }
}
