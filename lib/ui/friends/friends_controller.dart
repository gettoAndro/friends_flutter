import 'package:friends_flutter/data/database/db_client.dart';
import 'package:get/get.dart';

import '../../data/database/entity/friend_entity.dart';

class FriendsController extends GetxController {

  List<FriendEntity> friends = List<FriendEntity>.empty().obs;

  @override
  void onInit() {
    getFriends();
    super.onInit();
  }

  getFriends() async {
    var client = DatabaseClient();
    await client.create();
    friends = await client.getFriends();
    update();
  }

  deleteFriend(FriendEntity friendEntity) async {
    var client = DatabaseClient();
    await client.create();
    await client.delete(friendEntity);
    friends.remove(friendEntity);
    update();
  }

}