abstract class BaseApiService {
  Future<dynamic> getAPi(String url);

  Future<dynamic> postAPi(dynamic data, String url);
}
