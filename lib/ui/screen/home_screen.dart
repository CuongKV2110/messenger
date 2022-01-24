import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:messenger/bloc/app/app_bloc.dart';
import 'package:messenger/bloc/home/home_bloc.dart';
import 'package:messenger/bloc/home/home_event.dart';
import 'package:messenger/ui/screen/menu_screen.dart';
import 'package:messenger/ui/widget/add_story.dart';
import 'package:messenger/ui/widget/friend_item.dart';
import 'package:messenger/ui/widget/mess_item.dart';
import 'package:messenger/ui/widget/search.dart';
import 'package:messenger/ui/widget/stories_item.dart';
import 'package:messenger/ui/widget/stories_item2.dart';

import 'mess_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _homeBloc.add(GetData());
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc.dispose();
  }

  void _onTapScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = 'Chats';
    if (_selectedIndex == 0) {
      title = 'Chats';
    }

    if (_selectedIndex == 1) {
      title = 'Bạn bè';
    }

    if (_selectedIndex == 2) {
      title = 'Tin';
    }

    return BlocListener(
      listener: (context, event) {
        if (event is GetData) {
          print("Loading");
        }
      },
      bloc: _homeBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const MenuScreen();
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CachedNetworkImage(
                imageUrl: AppBloc.singleton.account.avatarUrl,
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
        body: BlocBuilder(
          bloc: _homeBloc,
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: _buildBody(),
            );
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
              label: "Bạn bè",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.book_outline),
              label: "Tin",
            ),
          ],
          onTap: (int index) {
            _onTapScreen(index);
          },
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return _buildMess();
    } else if (_selectedIndex == 1) {
      return _buildFriend();
    } else {
      return _buildStory();
    }
  }

  Widget _buildMess() {
    return CustomScrollView(
      slivers: [
        const Search(),
        _buildListStories(),
        _buildListMess(),
      ],
    );
  }

  Widget _buildListStories() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 8),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.94,
            height: 80,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const AddStory(),
                  const SizedBox(
                    width: 14,
                  ),
                  ListView.builder(
                    itemCount: _homeBloc.stories.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return StoriesItem(_homeBloc.stories[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }, childCount: 1),
    );
  }

  Widget _buildListMess() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            child: MessItem(_homeBloc.users[index]),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const MessScreen();
                  },
                ),
              );
            },
          );
        },
        childCount: _homeBloc.users.length,
      ),
    );
  }

  Widget _buildFriend() {
    return ListView.builder(
      itemCount: _homeBloc.stories.length,
      itemBuilder: (context, index) {
        return FriendItem(_homeBloc.stories[index]);
      },
    );
  }

  Widget _buildStory() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          //crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return StoriesItem2(_homeBloc.stories[index]);
        },
        itemCount: _homeBloc.stories.length,
      ),
    );
  }
}
