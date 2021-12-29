import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  _onTapScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Chats", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/avt.jpg'),
              ),
            ),
          )),
      body: SafeArea(child: getBody()),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Ionicons.chatbubble_ellipses_outline), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.call_outline), label: "Calls"),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.people_outline), label: "Stories"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapScreen,
      ),
    );
  }

  Widget getBody() {
    if (_selectedIndex == 0) {
      return _buildChatScreen();
    } else {
      return _buildStoryScreen();
    }
  }

  Widget _buildChatScreen() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Text("aaaaa"),
          Text("aaaaa"),
          Text("aaaaa"),
        ],
      ),
    );
  }

  Widget _buildStoryScreen() {
    return Center();
  }
}
