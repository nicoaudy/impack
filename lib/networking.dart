import 'package:dio/dio.dart';

class Networking {
  final Dio _dio = Dio();

  final _baseUrl = 'https://private-932bf-impack.apiary-mock.com';

  Future getActivities() async {
    Response response = await _dio.get(_baseUrl + '/activities');
    return response.data;
  }
}
