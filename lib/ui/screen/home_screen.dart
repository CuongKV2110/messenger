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
  List<Stories> listStory = [];
  int _selectedIndex = 0;

  _onTapScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if (state is InfoSuccess) {
          print("INFO");
        }
        if (state is FriendSuccess) {
          print("Friend");
        }
        if (state is StorySuccess) {
          print("Story");
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
        body: _buildBody(),
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
      ),
    );
  }

  Widget _buildBody(){
    if(_selectedIndex == 0){
      return Text('A');
    }
    else if(_selectedIndex == 1){
      return Text('B');
    }
    else{
      return(Text('C'));
    }
  }
}
