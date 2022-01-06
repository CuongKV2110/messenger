import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/models/response/user_response.dart';
import 'package:messenger/models/user.dart';
import 'package:messenger/providers/user_provider.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final UserProvider _userProvider = UserProvider();
  AppBloc() : super(HomeInitial());
  String errorHomeage = '';
  List<User> users = [];

  void dispose(){
    close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is GetUser) {
        yield HomeProcessing();
        // await Future.delayed(const Duration(milliseconds: 1500), () {});

        var res = await _userProvider.getData();

        if (res.success) {
          users = (res as UserResponse).data;
          yield HomeSuccess();
        } else {
          errorHomeage = 'Get User Error';
          yield HomeError();
        }
    }
    if (event is ChatView) {
      print("ChatView");
    }
    if (event is StoryView) {
      print("ChatView");
    }
    if (event is FriendView) {
      print("ChatView");
    }
    if (event is InfoView) {
      print('Info View');
      yield HomeSuccess();
    }
  }
}
