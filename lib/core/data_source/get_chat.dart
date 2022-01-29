import 'dart:math';

import 'package:messenger_ui_clone/core/data_source/get_all_users.dart';
import 'package:messenger_ui_clone/core/model/chat.dart';

List<Chat> getChat() {
  return allUsers()
      .map((e) => Chat(
          user: e,
          lastMessage: _getRandomMessage(),
          isSeen: _getIsseen(),
          date: '9:33 AM'))
      .toList();
}

String _getRandomMessage() {
  var msg = [
    "Let's goto party!",
    "We have a match tomorrow",
    "I think I will leave the club",
    "I will miss my training :(",
    "Why didn't you show up yesterday?",
  ];
  msg.shuffle();
  return msg.first;
}

bool _getIsseen() {
  return Random().nextBool();
}
