import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/ui/pages/me/me_page.dart';

class UserAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  const UserAppbar({
    Key? key,
    required this.title,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MePage(),
          ));
        },
        child: Transform.scale(
          scale: 0.7,
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media-exp1.licdn.com/dms/image/C4E03AQEgHjX-bN8Nug/profile-displayphoto-shrink_200_200/0/1631543983625?e=1645056000&v=beta&t=BZ97gdYWoJvAD8z2it3qFSz7BYCFarufG-dsBQIeiKQ'),
          ),
        ),
      ),
      centerTitle: false,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, kToolbarHeight);
}
