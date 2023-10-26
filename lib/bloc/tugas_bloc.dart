import 'dart:convert';
import 'package:responsi1/helpers/api.dart';
import 'package:responsi1/helpers/api_url.dart';
import 'package:responsi1/model/tugas.dart';

class TugasBloc {
  static Future<List<Tugas>> getTugas() async {
    String apiUrl = ApiUrl.listTugas;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listTugas = (jsonObj as Map<String, dynamic>)['result'];
    List<Tugas> tugass = [];
    for (int i = 0; i < listTugas.length; i++) {
      tugass.add(Tugas.fromJson(listTugas[i]));
    }
    return tugass;
  }

  static Future addTugas({Tugas? tugas}) async {
    String apiUrl = ApiUrl.createTugas;

    var body = {
      "title": tugas!.title,
      "description": tugas.description,
      "deadline": tugas.deadline
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateTugas({required Tugas tugas}) async {
    String apiUrl = ApiUrl.updateTugas(tugas.id!);

    var body = {
      "title": tugas.title,
      "description": tugas.description,
      "deadline": tugas.deadline
    };
    print("Body : $body");
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);

    // Periksa status respons dan kembalikan hasil yang sesuai
    if (jsonObj['status'] == 'success') {
      return true; // Berhasil mengubah tugas
    } else {
      return false; // Gagal mengubah tugas
    }
  }

  static Future<bool> deleteTugas({int? id}) async {
    String apiUrl = ApiUrl.deleteTugas(id!);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['result'];
  }
}
