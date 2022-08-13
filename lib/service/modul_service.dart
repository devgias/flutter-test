part of 'services.dart';

class ModulService {
  static Future<ApiReturnValue<ModulModel>> getSingleModul(
      {required String? type, String? search}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await http.get(
        Uri.parse(baseApi + 'doc?search=$search&type=$type'),
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      final json = jsonDecode(response.body);

      if (response.statusCode != 200) {
        String message = json['meta']['message'] ?? 'Gagal mendapatkan modul';
        return ApiReturnValue(
          value: null,
          message: message,
        );
      }

      final modul = ModulModel.fromJson(json['data']);
      return ApiReturnValue(value: modul, message: 'berhasil');
    } catch (e) {
      return ApiReturnValue(value: null, message: e.toString());
    }
  }

  static Future<ApiReturnValue<List<ModulModel>>> getMultipleModuls(
      {required String? type, String? search}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await http.get(
        Uri.parse(baseApi + 'doc?search=$search&type=$type'),
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      final json = jsonDecode(response.body);

      if (response.statusCode != 200) {
        String message = json['meta']['message'] ?? 'Gagal mendapatkan modul';
        return ApiReturnValue(
          value: null,
          message: message,
        );
      }

      final moduls = (json['data'] as Iterable)
          .map((e) => ModulModel.fromJson(e))
          .toList();
      return ApiReturnValue(value: moduls, message: 'berhasil');
    } catch (e) {
      return ApiReturnValue(value: null, message: e.toString());
    }
  }
}
