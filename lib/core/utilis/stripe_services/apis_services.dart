import 'package:dio/dio.dart';

class ApisServices {
  final dio = Dio();

  Future<Response> post(
      {required String url,
      required String token,
      Object? data,
      String? contentType}) async {
    Response response = await dio.post(
      url,
      data: data,
      options: Options(headers: {
        'Authorization': "Bearer $token",
      }, contentType: contentType),
    );

    return response;
  }
}
