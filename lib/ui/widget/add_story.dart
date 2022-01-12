import 'package:flutter/material.dart';
class AddStory extends StatelessWidget {
  const AddStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 64,
          height: 64,
          child: Stack(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 36,
                left: 10,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.photo_camera_front),
                  ),
                ),
              )
            ],
          ),
        ),
        const Text("Tạo Story")
      ],
    );
  }
}
