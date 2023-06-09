import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:friends_flutter/data/database/db_client.dart';
import 'package:friends_flutter/data/database/entity/friend_entity.dart';
import 'package:get/get.dart';

import '../../data/dto/response/user_dto.dart';
import '../../domain/users_repository.dart';
import '../friends/friends_controller.dart';

class SearchFriendsController extends GetxController
    with StateMixin<List<UserDTO>> {
  List<UserDTO> users = List.empty(growable: true);
  int _page = 0;

  ScrollController scrollController = ScrollController();

  List<int> selectedIndex = List.empty(growable: true);

  getUsers(int page) async {
    if (_page == 0) {
      change(users, status: RxStatus.loading());
    }
    var items = await UsersRepository().getUsers(page);
    users.addAll(items);
    addItems();
    if (_page == 0) {
      change(users, status: RxStatus.success());
    }
    update();
  }

  addItems() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        getUsers(_page++);
      }
    });
  }

  @override
  void onInit() {
    getUsers(0);
    super.onInit();
  }

  addFriend(int index) async {
    var client = DatabaseClient();
    await client.create();
    var user = users[index];
    client.insert(FriendEntity(
        name: user.name.fullName(),
        email: user.email,
        phone: user.phone,
        avatar: user.picture.medium));
    selectedIndex.add(index);
    update();
  }

  bool isSelectedItem(int index) => selectedIndex.contains(index);

  @override
  void onClose() {
    Get.find<FriendsController>().onInit();
  }
}
