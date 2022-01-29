import 'package:messenger_ui_clone/core/model/user.dart';

import 'get_all_users.dart';

List<User> getOnlineUsers() {
  return allUsers().where((element) => element.isOnline).toList();
}
