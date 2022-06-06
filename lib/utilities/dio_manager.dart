import 'package:dio/dio.dart';

class DioManager{
  final Dio _dio = Dio();

  Future<dynamic> getRequest(String apiURL, Map<String, dynamic> parameters, Options options) {
    return _requestHandling(_dio.get(apiURL, queryParameters: parameters, options: options));
  }

  Future<dynamic> putRequest(String apiURL, Map<String, dynamic> data, Options options) {
    return _requestHandling(_dio.put(apiURL, data: data, options: options));
  }

  Future<dynamic> deleteRequest(String apiURL, Map<String, dynamic> data, Options options) {
    return _requestHandling(_dio.delete(apiURL, data: data, options: options));
  }

  Future<dynamic> postRequest(String apiURL, Map<String, dynamic> data, Options options) {
    return _requestHandling(_dio.post(apiURL, data: data, options: options));
  }

  Future<dynamic> _requestHandling(Future<Response> response) {
    return response.then((value){
      return value;
    }).catchError((e){
      print('http code: ${e.response?.statusCode} ${e.response?.statusMessage}');
      return (e.response);
    });
  }
}
