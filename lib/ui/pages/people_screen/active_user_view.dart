import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/core/data_source/online_user.dart';
import 'package:messenger_ui_clone/ui/pages/chat_screen/chat_page.dart';

class ActiveUsersView extends StatelessWidget {
  const ActiveUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = getOnlineUsers();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChatPage(
                friend: data[index],
              ),
            ));
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 17,
                      backgroundImage: NetworkImage(data[index].image),
                    ),
                    const CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                data[index].name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
    );
  }
}
