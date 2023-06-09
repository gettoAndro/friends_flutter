import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
    baseUrl: "https://randomuser.me",
    connectTimeout: const Duration(seconds: 30)));
