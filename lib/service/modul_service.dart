part of 'services.dart';

class ModulService {
  static Future<ApiReturnValue<ModulModel>> getSingleModuls(
      {required String? type, String? search}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/doc?search=$search&type=$type'),
        headers: {
          'Authorization': 'Bearer 1|MC6m9BI3VLRnw1WkjacbAfp20QzrNAvdopM5umrY',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        return ApiReturnValue(
          value: null,
          message: 'Failed to get moduls',
        );
      }

      final json = jsonDecode(response.body);
      final modul = ModulModel.fromJson(json['data']);

      return ApiReturnValue(value: modul, message: null);
    } catch (e) {
      return ApiReturnValue(value: null, message: e.toString());
    }
  }

  static Future<ApiReturnValue<List<ModulModel>>> getMultipleModuls(
      {required String? type, String? search}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/doc?search=$search&type=$type'),
        headers: {
          'Authorization': 'Bearer 1|MC6m9BI3VLRnw1WkjacbAfp20QzrNAvdopM5umrY',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        return ApiReturnValue(
          value: null,
          message: 'Failed to get moduls',
        );
      }

      final json = jsonDecode(response.body);
      final moduls = (json['data'] as Iterable)
          .map((e) => ModulModel.fromJson(e))
          .toList();
      return ApiReturnValue(value: moduls, message: null);
    } catch (e) {
      return ApiReturnValue(value: null, message: e.toString());
    }
  }
}
