import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/bloc/home/home_bloc.dart';
import 'package:messenger/bloc/home/home_event.dart';
import 'package:messenger/models/story.dart';
import 'package:messenger/ui/widget/search_item.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({Key? key}) : super(key: key);

  @override
  _FriendScreenState createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  final HomeBloc _homeBloc = HomeBloc();
  List<Story> list = [];

  @override
  void initState() {
    super.initState();
    _homeBloc.add(GetData());
    list = _homeBloc.stories;
  }

  void runFilter(String enteredKeyword) {
    List<Story> results = [];
    if (enteredKeyword.isEmpty) {
      results = _homeBloc.stories;
    } else {
      results = _homeBloc.stories
          .where((stories) => stories.fullname
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      list = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, event) {
        if (event is GetData) {
          print('Loading');
        }
      },
      bloc: _homeBloc,
      child: Scaffold(
        body: BlocBuilder(
          bloc: _homeBloc,
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SafeArea(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  _buildSearchBar(),
                  _buildListFriend(),
                ],
              )),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 2),
              child: TextField(
                onChanged: (value) {
                  return runFilter(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Tìm Kiếm',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Hủy',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildListFriend() {
    return Expanded(
      child: list.isNotEmpty
          ? ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return SearchItem(list[index]);
          })
          : const Text('Không tìm thấy người dùng'),
    );
  }
}
