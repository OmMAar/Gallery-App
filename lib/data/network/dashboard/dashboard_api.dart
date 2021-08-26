import 'dart:async';

import 'package:dio/dio.dart';
import 'package:nabed_test/data/network/constants/endpoints.dart';
import 'package:nabed_test/data/network/dio_client.dart';
import 'package:nabed_test/data/network/rest_client.dart';
import 'package:nabed_test/models/dashboard/dashboard_model.dart';

class DashboardApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  DashboardApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<DashboardModel> getDashboardInfo() async {
    try {
      final res = await _dioClient.get(Endpoints.DashboardInfoUrl,
          options: Options(headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFkbWluIiwibmFtZWlkIjoiY2IwYzhlN2MtMWUyZC00YzhkLTllZjktYzA0YmUzZWJmYTM1IiwibmJmIjoxNjI3NzM3OTYyLCJleHAiOjE2NTkyNzM5NjIsImlhdCI6MTYyNzczNzk2Mn0.XIqwlHIxhsRK92c_MOarxu4Go4cdnV1d_a1OK9lGFy8"
          }));
      return DashboardModel.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
