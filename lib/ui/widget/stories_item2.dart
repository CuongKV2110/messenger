import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:messenger/models/story.dart';
import 'package:messenger/ui/screen/story_detail.dart';

class StoriesItem2 extends StatelessWidget {
  Story story;

  StoriesItem2(this.story);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return StoryDetail(story);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 6),
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.grey,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: story.str,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      opacity: 80,
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
                top: 4,
                left: 4,
                child: Container(
                  width: 42,
                  height: 42,
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
                        width: 40,
                        height: 40,
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
              story.status == 'online' ? Positioned(
                left: 32,
                top: 34,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ) : const SizedBox(),
              Positioned(
                left: 6,
                bottom: 8,
                child: Text(story.fullname, style: const TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
