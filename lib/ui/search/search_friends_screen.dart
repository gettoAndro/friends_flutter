import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friends_flutter/ui/search/search_friends_controller.dart';
import 'package:get/get.dart';

class SearchFriendsScreen extends StatelessWidget {
  final controller = Get.put(SearchFriendsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search friends"),
      ),
      body: SafeArea(
        child: GetBuilder<SearchFriendsController>(
          builder: (controller) => controller.obx(
              (state) => ListView.separated(
                    controller: controller.scrollController,
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) => ListTile(
                        title: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage: NetworkImage(
                                controller.users[index].picture.medium)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child:
                                Text(controller.users[index].name.fullName()),
                          ),
                        ),
                        IconButton(
                            alignment: Alignment.centerRight,
                            onPressed: controller.isSelectedItem(index)
                                ? null
                                : () => {controller.addFriend(index)},
                            icon: controller.isSelectedItem(index)
                                ? const Icon(
                                    color: Colors.green, Icons.done)
                                : const Icon(Icons.add))
                      ],
                    )),
                    separatorBuilder: (context, index) => const Divider(),
                  ),
              onLoading: progressBar()),
        ),
      ),
    );
  }

  Widget progressBar() => const Center(
        child: CircularProgressIndicator(),
      );
}
