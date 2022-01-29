import 'package:messenger_ui_clone/core/data_source/get_all_users.dart';
import 'package:messenger_ui_clone/core/model/story.dart';

List<Story> getStories() {
  return allUsers()
      .map((e) =>
          Story(user: e, storyImages: _getRamdomImages(), time: '1:00 PM'))
      .toList();
}

List<String> _getRamdomImages() {
  var images = [
    'https://pics.me.me/photoshopping-callmecarson-onto-random-things-day-1-67001857.png',
    'https://cdn.nceventpics.com/wp-content/uploads/2019/08/07162557/NCEventPics-RAL-Random-6.jpg',
    'http://www.blogtrot.com/wp-content/uploads/2012/01/sexy-alf.jpg',
    'https://images.unsplash.com/photo-1509281373149-e957c6296406?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHJhbmRvbXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1587590227264-0ac64ce63ce8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
    'https://images.unsplash.com/photo-1478479474071-8a3014d422c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    'https://images.unsplash.com/photo-1567529831511-4f2600063e38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  ];
  images.shuffle();

  List<String> listTosend = [];

  listTosend.addAll([images.first, images.last]);
  return listTosend;
}
