import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:messenger/helpers/date_helper.dart';
import 'package:messenger/models/story.dart';

class FriendItem extends StatelessWidget {
  Story story;

  FriendItem(this.story);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 2),
      child: Row(
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: story.avt,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) {
                    return const CircularProgressIndicator();
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      color: Colors.black,
                      child: const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    );
                  },
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
