import 'package:dio/dio.dart';
import 'package:naguib_selim/network/end_points.dart';

class NetworkManager {
  late Dio dio;
  CancelToken? cancelToken;

  Map<String, dynamic> headers = {
    "Accept": "application/json",
    "locale": "en", //UserCache.instance.getLanguage(),
    "device-token": "device-token-ios", //UserCache.instance.getDeviceId(),
  };

  NetworkManager({this.cancelToken}) {
    setupDio();
  }

  void setupDio() {
    dio = Dio();
    // if (UserCache.instance.isLoggedIn()) {
    //   headers["Authorization"] =
    //       "Bearer ${UserCache.instance.getAccessToken()}";
    // }
    var baseURL = Endpoints.baseUrl;
    // if (isProductionMood == false) {
    //   baseURL = Endpoints.stagingBaseUrl;
    // }
    dio.options = BaseOptions(headers: headers, baseUrl: baseURL);
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  Future post<T>(
    String url, {
    required Map<String, dynamic> param,
    required Map<String, dynamic> body,
  }) async {
    try {
      Map<String, dynamic> innerBody = {};
      print(
          "------------------------------------------------------------------------------");
      print("url -->  " + url);

      if (param == null) param = new Map();

      if (body != null) {
        innerBody = body;
        print("body -->  " + body.toString());
      }

      print("Inner Body -->  " + innerBody.toString());

      Response? response = await dio?.post(
        url,
        queryParameters: param,
        data: innerBody,
      );
      print("-------------- We Got A Response ------------");
      print(response);
      // return _handleResponse(response);
    } catch (error) {
      print("-------------- We Got An Error ------------");
      print(error);
      // _handleError(error);
    }
  }

  // handleResponse<T>(Response response) {
  // if (response.statusCode == 200) {
  //   Map map = response.data;
  //   var model;
  //   if (T == RequestUpdatePhoneResponse) {
  //     print("MODEL INSIDE HRERERERERER");
  //     model = map;
  //   } else {
  //     model = map["data"];
  //   }

  //   if (model is String) {
  //     return model;
  //   }

  //   if (model is int) {
  //     return model;
  //   }

  //   if (model is bool) {
  //     return model;
  //   }

  //   if (model is List)
  //     return _parseList<T>(model);
  //   else
  //     return _parseModel<T>(model);
  // } else {
  //   _handleError(null, isParsingError: true);
  // }
  // }
}
