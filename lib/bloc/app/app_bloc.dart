import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/bloc/app/app_event.dart';
import 'package:messenger/bloc/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(MessInitial());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is ChatViews) {}
    if (event is StoryViews) {}
    if (event is FriendViews) {}
    if (event is FriendSearch) {}
    if (event is InfoView) {}
  }
}
