import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/modules/stories_user.dart';

class MessScreen extends StatefulWidget {
  const MessScreen({Key? key}) : super(key: key);

  @override
  _MessScreenState createState() => _MessScreenState();
}

class _MessScreenState extends State<MessScreen> {
  List<StoriesUser> listStory = [];

  @override
  void initState() {
    initData();
  }

  initData() {
    listStory.add(StoriesUser(name: 'Linh', url: 'images/user1.jpg'));
    listStory.add(StoriesUser(name: 'Linh', url: 'images/user2.jpg'));
    listStory.add(StoriesUser(name: 'Linh', url: 'images/user3.jpg'));
    listStory.add(StoriesUser(name: 'Linh', url: 'images/user4.jpg'));
    listStory.add(StoriesUser(name: 'Linh', url: 'images/user5.jpg'));
    listStory.add(StoriesUser(name: 'Linh', url: 'images/user6.jpg'));
    listStory.add(StoriesUser(name: 'Linh', url: 'images/user7.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("AAA"),
    );
  }

  /*
  CustomScrollView(
      slivers: [
        SliverAppBar(
          // stretch: true,
          automaticallyImplyLeading: false,
          pinned: false,
          expandedHeight: 60,
          // collapsedHeight: 60,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [
              StretchMode.zoomBackground,
              StretchMode.blurBackground
            ],
            background: Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.94,
                height: 76,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            child: Stack(
                              children: [
                                Container(
                                  width: 58,
                                  height: 58,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Container(
                                      width: 56,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 36,
                                  left: 10,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.photo_camera_front),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text("Tạo Story")
                        ],
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      ListView.builder(
                        itemCount: listStory.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 58,
                                        height: 58,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 2, color: Colors.blue)),
                                        child: Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Container(
                                            width: 56,
                                            height: 56,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage(listStory[index].url),
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
                                            border: Border.all(
                                                width: 2, color: Colors.white),
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(listStory[index].name)
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }, childCount: 1),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(listStory[index].url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listStory[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Text("Hello"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("10:30"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }, childCount: listStory.length),
        )
      ],
    )
  */
}
