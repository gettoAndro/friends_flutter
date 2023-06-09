import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friends_flutter/ui/friends/friends_controller.dart';
import 'package:friends_flutter/ui/search/search_friends_screen.dart';
import 'package:get/get.dart';

class FriendsScreen extends StatelessWidget {
  final controller = Get.lazyPut(() => FriendsController());

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          Get.to(() => SearchFriendsScreen());
        }, icon: const Icon(Icons.search))
        ],
        title: const Text("Friends"),
      ),
      body: SafeArea(
        child: GetBuilder<FriendsController>(
            builder: (controller) =>
            controller.friends.isNotEmpty
                ? content(controller)
                : emptyContainer()),
      ),
    );
  }

  Widget emptyContainer() =>
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text("No friends yet"),
            ),
            ElevatedButton(
                onPressed: () => Get.to(() => SearchFriendsScreen()),
                child: const Icon(Icons.search))
          ],
        ),
      );

  Widget content(FriendsController controller) =>
      Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: controller.friends.length,
            itemBuilder: (context, index) =>
                ListTile(
                    title: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage:
                            NetworkImage(controller.friends[index].avatar)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(controller.friends[index].name),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.deleteFriend(
                                  controller.friends[index]);
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                            ))
                      ],
                    )),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ],
      );
}
