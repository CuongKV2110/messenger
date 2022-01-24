import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:messenger/models/story.dart';
import 'package:messenger/ui/screen/profile_screen.dart';
class SearchItem extends StatelessWidget {
  Story story;

  SearchItem(this.story);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ProfileScreen(story);
            },
          ),
        );
      },
      child: Card(
        elevation: 0,
        borderOnForeground: false,
        key: ValueKey(story.fullname),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: story.avt,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
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
                          bottom: 10,
                          left: 38,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              border:
                              Border.all(width: 2, color: Colors.white),
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                            : const SizedBox()
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                height: 62,
                width: MediaQuery.of(context).size.width*0.72,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story.fullname,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(story.friend.toString() + ' bạn chung'),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
