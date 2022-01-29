import 'package:messenger_ui_clone/core/model/user.dart';

class Story {
  final User user;
  final List<String> storyImages;
  final String time;
  Story({
    required this.user,
    required this.storyImages,
    required this.time,
  });
}
