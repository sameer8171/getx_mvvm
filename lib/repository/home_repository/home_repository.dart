
import 'package:getx_mvvm/data/Network/Network_Api_Services.dart';
import 'package:getx_mvvm/models/home/UserListResponse.dart';
import 'package:getx_mvvm/res/app_url/AppUrl.dart';

class HomeRepository {
  final _apiService = NetworkApiService();

  Future<UserListResponse> userListApi()async{
    dynamic response = await _apiService.getAPi( AppUrl.userListApi);
    return UserListResponse.fromJson(response);
  }
}