import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/ui/pages/chat_screen/chat_list_screen.dart';
import 'package:messenger_ui_clone/ui/pages/people_screen/people_screen.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  var currentIndex = 0;
  final bottomNavItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_rounded), label: 'Chats'),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
  ];

  var pages = const [ChatListScreen(), PeopleScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: bottomNavItems,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.shade600,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        children: pages,
        index: currentIndex,
      ),
    );
  }
}
