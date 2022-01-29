import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/core/model/story.dart';

class StoryDetailPage extends StatefulWidget {
  final Story story;
  const StoryDetailPage({Key? key, required this.story}) : super(key: key);

  @override
  State<StoryDetailPage> createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget progress() {
      return TweenAnimationBuilder(
        duration: const Duration(seconds: 2),
        onEnd: () {
          try {
            if (mounted) Navigator.pop(context);
          } catch (e) {
            print(e);
          }
        },
        tween: Tween<double>(begin: 0.0, end: 1.0),
        builder: (BuildContext context, double value, Widget? child) {
          return LinearProgressIndicator(color: Colors.white, value: value);
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Image.network(widget.story.storyImages.first),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  progress(),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 14,
                          backgroundImage:
                              NetworkImage(widget.story.user.image)),
                      const SizedBox(width: 8),
                      Text(widget.story.user.name),
                      const Spacer(),
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
