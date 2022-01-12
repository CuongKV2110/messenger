import 'package:flutter/material.dart';
import 'package:messenger/models/story.dart';

class StoriesItem extends StatelessWidget {
  Story story;

  StoriesItem(this.story);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              children: [
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.blue)),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(story.avt),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: 42,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(story.name)
        ],
      ),
    );
  }
}
