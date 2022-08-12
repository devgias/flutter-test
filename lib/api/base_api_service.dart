abstract class BaseApiServices {
  Future<dynamic> get(String url, {Map<String, String>? headers});
  //FOR LATER USE
  // Future<dynamic> post(String url, {Map<String, dynamic> headers, body});
  // Future<dynamic> put(String url, {Map<String, dynamic> headers, body});
  // Future<dynamic> delete(String url, {Map<String, dynamic> headers});
}
