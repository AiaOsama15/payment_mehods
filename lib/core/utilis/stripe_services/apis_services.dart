import 'package:dio/dio.dart';

class ApisServices {
  final dio = Dio();

  Future<Response> post(
      {required String url,
      required String token,
      Object? data,
      String? contentType}) async {
    return await dio.post(
      url,
      data: data,
      options: Options(
          contentType: 'application/x-www-form-urlencoded',
          headers: {'Authorization': "Bearer $token"}),
    );
  }
}
