import 'package:messenger_ui_clone/core/model/user.dart';

class Chat {
  final User user;
  final String lastMessage;
  final bool isSeen;
  final String date;
  Chat({
    required this.user,
    required this.lastMessage,
    required this.isSeen,
    required this.date,
  });
}
