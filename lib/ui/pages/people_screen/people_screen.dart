import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/ui/pages/people_screen/active_user_view.dart';
import 'package:messenger_ui_clone/ui/pages/people_screen/story/stories_view.dart';
import 'package:messenger_ui_clone/ui/widgets/user_app_bar.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  var currentPage = 0;
  var pages = const [StoriesView(), ActiveUsersView()];
  var pageHeader = ["Stories (8)", "Active (6)"];
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: pageHeader.map((e) {
            var isSelected = e == pageHeader[currentPage];
            return InkWell(
              onTap: () {
                setState(() {
                  currentPage = pageHeader.indexOf(e);
                });
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isSelected ? Colors.grey.shade800 : Colors.black,
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal),
                  )),
            );
          }).toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: UserAppbar(title: 'People', actions: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: const Icon(
            Icons.contacts_outlined,
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
          child: Column(
            children: [
              header(),
              IndexedStack(
                children: pages,
                index: currentPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
