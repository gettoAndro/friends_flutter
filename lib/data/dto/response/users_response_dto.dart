import 'package:dio/dio.dart';
import 'package:friends_flutter/data/dto/response/user_dto.dart';

class UsersResponseDTO {
  List users;

  UsersResponseDTO({required this.users});

  static List<UserDTO> fromJson(Response response) =>
      (response.data["results"] as List)
          .map((e) => UserDTO.fromJson(e))
          .toList();
}
