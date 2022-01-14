import 'package:flutter/material.dart';
import 'package:messenger/ui/screen/friend_screen.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // stretch: true,
      automaticallyImplyLeading: false,
      pinned: false,
      expandedHeight: 60,
      // collapsedHeight: 60,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground
        ],
        background: Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onDoubleTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const FriendScreen();
                    },
                  ),
                );
              },
              child: const TextField(
                keyboardType: TextInputType.none,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Tìm kiếm",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
