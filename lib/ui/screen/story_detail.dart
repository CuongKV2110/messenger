import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:messenger/helpers/date_helper.dart';
import 'package:messenger/models/story.dart';

class StoryDetail extends StatelessWidget {
  Story story;

  StoryDetail(this.story);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: story.str,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
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
            Positioned(
              left: 66,
              top: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        story.fullname,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      story.status == 'online'
                          ? const Icon(
                              Icons.public_sharp,
                              color: Colors.white,
                              size: 18,
                            )
                          : const Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 18,
                            )
                    ],
                  ),
                  Text(
                    DateHelper.getTimeAgo(story.time),
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Positioned(
              top: 4,
              left: 8,
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: CachedNetworkImage(
                    imageUrl: story.avt,
                    imageBuilder: (context, imageProvider) => Container(
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
                ),
              ),
            ),
            story.status == 'online'
                ? Positioned(
                    left: 40,
                    top: 44,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : const SizedBox(),
            Positioned(
                top: 12,
                right: 14,
                child: Row(
                  children: [
                    const Icon(
                      Ionicons.ellipsis_horizontal,
                      size: 24,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Ionicons.close,
                        size: 34,
                        color: Colors.white,
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
