import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MessScreen extends StatefulWidget {
  const MessScreen({Key? key}) : super(key: key);

  @override
  _MessScreenState createState() => _MessScreenState();
}

class _MessScreenState extends State<MessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        backgroundColor: Colors.white,
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://znews-photo.zadn.vn/w660/Uploaded/ofh_huqfztmf/2021_09_30/GetPaidStock.com_6154f2f06abbe_1.jpg',
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "C.Ronaldo",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Online",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Ionicons.chevron_back,
            color: Colors.indigoAccent,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.call,
              size: 26,
              color: Colors.indigoAccent,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.videocam,
              size: 30,
              color: Colors.indigoAccent,
            ),
          )
        ],
      ),
      body: Column(
        children: [Text('Hello')],
      ),
    );
  }
}
