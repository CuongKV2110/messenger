import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:messenger/bloc/app/app_bloc.dart';
import 'package:messenger/bloc/app/app_event.dart';
import 'package:messenger/bloc/app/app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppBloc _appBloc = AppBloc();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _appBloc.add(GetUser());
    _appBloc.add(GetStory());
  }

  @override
  void dispose() {
    super.dispose();
    _appBloc.dispose();
  }

  _onTapScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        listener: (context, state) {
          if (state is HomeSuccess) {
            print("Mess Success");
          }
        },
        bloc: _appBloc,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Chats",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                _appBloc.add(InfoView());
              },
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avt.jpg'),
                ),
              ),
            ),
          ),
          body: BlocBuilder(
            bloc: _appBloc,
            builder: (context, state) {
              return _buildBody();
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Ionicons.chatbubble_ellipses_outline),
                label: "Chats",
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.people_outline),
                label: "Friends",
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.book_outline),
                label: "Stories",
              ),
            ],
            onTap: (int index) {
              _onTapScreen(index);
            },
            currentIndex: _selectedIndex,
          ),
        ));
  }

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return CustomScrollView(
        slivers: [
          SliverAppBar(
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
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
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
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  height: 80,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
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
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.photo_camera_front),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Text("Tạo Story")
                          ],
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        ListView.builder(
                          itemCount: _appBloc.stories.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: Column(
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 62,
                                          height: 62,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.blue)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: NetworkImage(_appBloc
                                                      .stories[index].avt),
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
                                                  width: 2,
                                                  color: Colors.white),
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(_appBloc.stories[index].name)
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
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(_appBloc.users[index].avt),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _appBloc.users[index].name,
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
                              Text(_appBloc.users[index].chat),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(_appBloc.users[index].time),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              childCount: _appBloc.users.length,
            ),
          )
        ],
      );
    } else if (_selectedIndex == 1) {
      return ListView.builder(
        itemCount: _appBloc.stories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(12, 12, 12, 2),
            child: Row(
              children: [
                Container(
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
                            image: NetworkImage(_appBloc.stories[index].avt),
                            fit: BoxFit.cover,
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
                            border: Border.all(width: 2, color: Colors.white),
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_appBloc.stories[index].fullname, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 4,),
                    Text(_appBloc.stories[index].time)
                  ],
                )
              ],
            ),
          );
        },
      );
    } else {
      return ListView.builder(
        itemCount: _appBloc.stories.length,
        itemBuilder: (context, index) {
          return Text(_appBloc.stories[index].name);
        },
      );
    }
  }
}
