import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:messenger/bloc/app/app_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.96,
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CachedNetworkImage(
                        imageUrl: AppBloc.singleton.account.avatarUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 100,
                          height: 100,
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
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        AppBloc.singleton.account.name,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                          leading: const CircleAvatar(
                            radius: 18,
                            child: Icon(
                              Ionicons.moon,
                              size: 18,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.black,
                          ),
                          title: const Text('Chế độ tối'),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text('Hệ thống'),
                                Icon(Ionicons.chevron_forward)
                              ],
                            ),
                          )),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.toggle,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.green,
                        ),
                        title: const Text('Trạng thái hoạt động'),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text('Tắt'),
                              Icon(Ionicons.chevron_forward)
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.chatbubble_ellipses_sharp,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        title: const Text('Tin nhắn đang chờ'),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.red,
                                ),
                                child: const Center(
                                  child: Text(
                                    '32',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Icon(Ionicons.chevron_forward)
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.archive,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.purple,
                        ),
                        title: const Text('Đoạn chat đã lưu trữ'),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.red,
                                ),
                                child: const Center(
                                  child: Text(
                                    '15',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Icon(Ionicons.chevron_forward)
                            ],
                          ),
                        ),
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.call,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        title: Text('Số di động'),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.shield,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        title: Text('Quyền riêng tư'),
                        trailing: Icon(Ionicons.chevron_forward),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.notifications,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.purple,
                        ),
                        title: const Text('Thông báo & âm thanh'),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text('Bật'),
                              Icon(Ionicons.chevron_forward)
                            ],
                          ),
                        ),
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.people,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.purple,
                        ),
                        title: Text('Danh bạ điện thoại'),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.book,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.pinkAccent,
                        ),
                        title: Text('Tin'),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.person,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.purple,
                        ),
                        title: Text('Avatar'),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.image,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.green,
                        ),
                        title: Text('Ảnh & file phương tiện'),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: const [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.git_compare_sharp,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.purple,
                        ),
                        title: Text('Chuyển tài khoản'),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.settings_sharp,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text('Cài đặt tài khoản'),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.warning_sharp,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.deepOrange,
                        ),
                        title: Text('Báo cáo sự cố'),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.hand_right_sharp,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        title: Text('Trợ giúp'),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          child: Icon(
                            Ionicons.document_text_sharp,
                            size: 18,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text('Pháp lý & chính sách'),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
