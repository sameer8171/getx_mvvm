
import 'package:getx_mvvm/data/Network/Network_Api_Services.dart';
import 'package:getx_mvvm/res/app_url/AppUrl.dart';

class LoginRepository {
  final _apiService = NetworkApiService();

  Future<dynamic> loginApi(var data)async{
    dynamic response =await _apiService.postAPi(data, AppUrl.loginApi);
    return response;

  }
}