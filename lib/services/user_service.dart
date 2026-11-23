import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/user.dart';

class ApiService {
  Future<List<User>> fetchUsers() async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}',
    );

    try {
      // 1) Minta data (maksimal tunggu 10 detik)
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      // 2) Cek apakah berhasil (200 = OK)
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is! List) {
          throw const FormatException('Format data user tidak valid.');
        }
        return data
            .map((item) => User.fromJson(Map<String, dynamic>.from(item as Map)))
            .toList();
      } else {
        throw Exception('Gagal memuat data (kode: ${response.statusCode})');
      }
    } on TimeoutException {
      throw Exception('Koneksi terlalu lama. Coba lagi.');
    }
  }
}