import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.white,
        ),
        centerTitle: false,
        title: const Text('Me'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: CircleAvatar(
              radius: 50,
              foregroundImage: NetworkImage(
                  'https://media-exp1.licdn.com/dms/image/C4E03AQEgHjX-bN8Nug/profile-displayphoto-shrink_200_200/0/1631543983625?e=1645056000&v=beta&t=BZ97gdYWoJvAD8z2it3qFSz7BYCFarufG-dsBQIeiKQ'),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Aayush Nikkon Subedi',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
