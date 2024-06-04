import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

//method to make request + get response from request
  Future<Response> postCreation(
      {required data,
      required String url,
      required String token,
      String? contentType}) async {
    try {
      var response = await dio.post(url,
          data: data,
          options: Options(
            // contentType: contentType,
            headers: {
              'Content-Type' : contentType,
              'Authorization': "Bearer $token",
            },
          ));
      return response;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
