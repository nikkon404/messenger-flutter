import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/core/data_source/get_messages.dart';
import 'package:messenger_ui_clone/core/model/user.dart';

class ChatPage extends StatelessWidget {
  final User friend;
  const ChatPage({Key? key, required this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = getMessages();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          leading: const BackButton(color: Colors.blue),
          leadingWidth: 20,
          title: ListTile(
            title: Text(friend.name),
            subtitle: Text(friend.isOnline ? 'Active Now' : 'Active 3h ago'),
            leading: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(friend.image),
                ),
                if (friend.isOnline)
                  const CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.green,
                  ),
              ],
            ),
          ),
          actions: const [
            Icon(Icons.call, color: Colors.blue),
            SizedBox(width: 20),
            Icon(Icons.videocam, color: Colors.blue),
            SizedBox(width: 20),
            Icon(Icons.info, color: Colors.blue),
            SizedBox(width: 12),
          ]),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    children: data.map((e) {
                      bool isSendByUser = data.indexOf(e) % 2 == 0;
                      return Container(
                        // alignment: Alignment.centerRight,
                        margin: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            if (!isSendByUser)
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(friend.image),
                                  radius: 12,
                                ),
                              )
                            else
                              const Spacer(),
                            Container(
                              // alignment: isSendByUser
                              //     ? Alignment.centerRight
                              //     : Alignment.centerLeft,
                              padding: const EdgeInsets.all(8),
                              constraints: BoxConstraints(
                                maxWidth: size.width * 0.5,
                                minWidth: size.width * 0.1,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: isSendByUser
                                      ? Colors.blue
                                      : Colors.grey.shade800),
                              child: Text(
                                e,
                              ),
                            ),
                            if (!isSendByUser) const Spacer()
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const TextInputWidget(),
          ],
        ),
      ),
    );
  }
}

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 50,
      child: Row(
        children: [
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(12)),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Type a message ...',
                        contentPadding:
                            EdgeInsets.only(left: 8, bottom: 50 / 4)),
                  ))),
          const SizedBox(width: 5),
          const Icon(
            Icons.thumb_up,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
