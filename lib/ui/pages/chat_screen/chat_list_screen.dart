import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/core/data_source/online_user.dart';
import 'package:messenger_ui_clone/ui/pages/chat_screen/chat_list_widget.dart';
import 'package:messenger_ui_clone/ui/widgets/user_app_bar.dart';

import 'chat_page.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: UserAppbar(title: 'Chats', actions: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: const Icon(
            Icons.camera_alt_rounded,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 14),
        CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12),
      ]),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
          setState(() {});
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                searchBar(),
                onlineUserView(context),
                const ChatListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget searchBar() {
  var height = 42.0;
  return Container(
    margin: const EdgeInsets.only(bottom: 14),
    height: height,
    decoration: BoxDecoration(
        color: Colors.grey.shade800, borderRadius: BorderRadius.circular(22)),
    child: const TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: 'Search',
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white38,
          size: 22,
        ),
      ),
    ),
  );
}

Widget onlineUserView(context) {
  var data = getOnlineUsers();
  data.shuffle();
  return Container(
    alignment: Alignment.topCenter,
    height: 100,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: data
          .map((e) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatPage(
                      friend: e,
                    ),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 2, right: 10, top: 5),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 31,
                            backgroundImage: NetworkImage(e.image),
                          ),
                          const CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.green,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(e.name)
                    ],
                  ),
                ),
              ))
          .toList(),
    ),
  );
}
