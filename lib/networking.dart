import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class Networking {
  final Dio _dio = Dio();

  final _baseUrl = 'https://private-932bf-impack.apiary-mock.com';

  Future<List> getActivities() async {
    Response response = await _dio.get(_baseUrl + '/activities');
    return response.data['activities'];
  }

  Future getActivity(String id) async {
    Response response = await _dio.get(_baseUrl + '/activity/' + id);
    return response.data;
  }

  Future postActivity(
    String activityType,
    String institution,
    String when,
    String objective,
    String remarks,
  ) async {
    var params = {
      "activityType": activityType,
      "institution": institution,
      "when": when,
      "objective": objective,
      "remarks": remarks
    };
    Response response = await _dio.post(
      _baseUrl + '/activities',
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      ),
      data: jsonEncode(params),
    );
    return response.data;
  }
}
