import 'package:dio/dio.dart';
import 'package:friends_flutter/data/dto/response/user_dto.dart';
import 'package:friends_flutter/data/dto/response/users_response_dto.dart';

import '../data/api.dart';

class UsersRepository {

  Future<List<UserDTO>> getUsers(int page) async {
      Response response = await dio.get("/api?page=$page&results=20");
      List<UserDTO> list = UsersResponseDTO.fromJson(response);
      return list;
  }

}