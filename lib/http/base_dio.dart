import 'package:dio/dio.dart';

var options = BaseOptions(
    baseUrl: 'https://www.wanandroid.com',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    responseType: ResponseType.json);
Dio dio = Dio(options);
