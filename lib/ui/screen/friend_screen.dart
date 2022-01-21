import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/bloc/home/home_bloc.dart';
import 'package:messenger/bloc/home/home_event.dart';
import 'package:messenger/models/story.dart';

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
                  const SizedBox(height: 6,),
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
              return Card(
                elevation: 0,
                borderOnForeground: false,
                key: ValueKey(list[index].fullname),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 64,
                            height: 64,
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: list[index].avt,
                                  imageBuilder: (context, imageProvider) => Container(
                                    width: 52,
                                    height: 52,
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
                                list[index].status == 'online'
                                    ? Positioned(
                                  bottom: 10,
                                  left: 38,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(width: 2, color: Colors.white),
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        height: 62,
                        width: MediaQuery.of(context).size.width*0.72,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].fullname,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(list[index].friend.toString() + ' bạn chung'),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              );
            })
          : Text(''),
    );
    /*return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: _homeBloc.stories[index].avt,
                            imageBuilder: (context, imageProvider) => Container(
                              width: 52,
                              height: 52,
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
                          _homeBloc.stories[index].status == 'online'
                              ? Positioned(
                            bottom: 10,
                            left: 38,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                border:
                                Border.all(width: 2, color: Colors.white),
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                              : const SizedBox()
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                const SizedBox(
                  width: 6,
                ),
                Container(
                  height: 62,
                  width: MediaQuery.of(context).size.width*0.72,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _homeBloc.stories[index].fullname,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(_homeBloc.stories[index].friend.toString() + ' bạn chung'),
                    ],
                  ),
                ),

              ],
            ),
          );
        },
        childCount: _homeBloc.stories.length,
      ),
    );*/
  }
}
