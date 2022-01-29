import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/core/data_source/get_chat.dart';

import 'chat_page.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = getChat();
    data.shuffle();
    return Column(
      children: data
          .map((e) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatPage(
                      friend: e.user,
                    ),
                  ));
                },
                child: SizedBox(
                  // color: Colors.grey,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(e.user.image),
                          ),
                          if (e.user.isOnline)
                            const CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.green,
                            ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: size.width * 0.75,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e.user.name,
                              style: TextStyle(
                                  fontWeight: !e.isSeen
                                      ? FontWeight.bold
                                      : FontWeight.w400),
                            ),
                            Flexible(
                              child: Text(
                                e.lastMessage + ' - ' + e.date,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: !e.isSeen
                                        ? FontWeight.bold
                                        : FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      if (e.isSeen)
                        CircleAvatar(
                          radius: 8,
                          backgroundImage: NetworkImage(e.user.image),
                        ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
