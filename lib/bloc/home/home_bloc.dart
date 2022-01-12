import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/models/story.dart';
import 'package:messenger/models/user.dart';
import 'package:messenger/providers/story_provider.dart';
import 'package:messenger/providers/user_provider.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserProvider _userProvider = UserProvider();
  final StoryProvider _storyProvider = StoryProvider();
  HomeBloc() : super(HomeInitial());
  String errorHomeage = '';
  List<User> users = [];
  List<Story> stories = [];

  void dispose(){
    close();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetData) {
        yield HomeProcessing();
        // await Future.delayed(const Duration(milliseconds: 1500), () {});

        var res_user = await _userProvider.getData();
        var res_str = await _storyProvider.getData();

        if (res_user.success & res_str.success) {
          users = (res_user).data;
          stories = (res_str).data;
          yield HomeSuccess();
        } else {
          errorHomeage = 'Get User Error';
          yield HomeError();
        }
    }
  }
}
