import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:messenger/models/user.dart';

class MessItem extends StatelessWidget {
  User user;

  MessItem(this.user);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 5, 14, 12),
      child: Row(
        children: [
          /*Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(user.avt),
                fit: BoxFit.cover,
              ),
            ),
          ),*/
          CachedNetworkImage(
            imageUrl: user.avt,
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
              return  Container(
                color:Colors.black,
              );
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
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Text(user.chat),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(user.time),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
