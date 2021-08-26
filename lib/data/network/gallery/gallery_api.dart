import 'dart:async';

import 'package:dio/dio.dart';
import 'package:nabed_test/data/network/constants/endpoints.dart';
import 'package:nabed_test/data/network/dio_client.dart';
import 'package:nabed_test/data/network/rest_client.dart';
import 'package:nabed_test/models/dashboard/dashboard_model.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';

class GalleryApi {
  // dio instance
  final DioClient _dioClient;



  // injecting dio instance
  GalleryApi(this._dioClient);

  /// Returns list of post in response
  Future<GalleryModel> getGalleryInfo(
      {required int page,required int pageSize,required String key}) async {
    try {
      final res = await _dioClient.get(Endpoints.GalleryInfoUrl,
      queryParameters: {
        'key' : key,
        'page' :page,
        'per_page' : pageSize
      });
      return GalleryModel.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
