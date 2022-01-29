import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/core/data_source/get_stories.dart';
import 'package:messenger_ui_clone/ui/pages/people_screen/story/story_detail.dart';

class StoriesView extends StatelessWidget {
  const StoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 9 / 14,
        children: getStories()
            .map(
              (e) => Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StoryDetailPage(story: e),
                      ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: AspectRatio(
                        aspectRatio: 9 / 14,
                        child: Image.network(
                          e.storyImages.first,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 12,
                      left: 12,
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.blue,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundImage: NetworkImage(e.user.image),
                        ),
                      )),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        e.user.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
