import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:messenger/bloc/app/app_bloc.dart';
import 'package:messenger/bloc/app/app_event.dart';
import 'package:messenger/bloc/app/app_state.dart';
import 'package:messenger/models/stories.dart';

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
      // return ListView.builder(
      //   itemCount: _appBloc.users.length,
      //   itemBuilder: (context, index) {
      //     return Text(_appBloc.users[index].name);
      //   },
      // );

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
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 12),
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
      return Text("Friends");
    } else {
      return Text("Stories");
    }
  }
}
