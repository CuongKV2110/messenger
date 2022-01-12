import 'package:flutter/material.dart';
import 'package:messenger/helpers/date_helper.dart';
import 'package:messenger/models/story.dart';

class FriendItem extends StatelessWidget {
  Story story;

  FriendItem(this.story);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 2),
      child: Row(
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              children: [
                Container(
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
                story.status == 'online'
                    ? Positioned(
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
                    : const SizedBox()
              ],
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                story.fullname,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(story.status == 'online'
                  ? "Đang hoạt động"
                  : DateHelper.getTimeAgo(story.time))
            ],
          )
        ],
      ),
    );
  }
}
