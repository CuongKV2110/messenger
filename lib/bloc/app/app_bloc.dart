import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/bloc/app/app_event.dart';
import 'package:messenger/bloc/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(MessInitial());
  String errorMessage = '';

  void dispose(){
    super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is ChatView) {}
    if (event is StoryView) {}
    if (event is FriendView) {}
    if (event is FriendSearch) {}
    if (event is InfoView) {
      print('Info View');
      yield InfoSuccess();
    }
  }
}
