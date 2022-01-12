import 'package:bloc/bloc.dart';
import 'package:messenger/bloc/app/app_event.dart';
import 'package:messenger/bloc/app/app_state.dart';
import 'package:messenger/models/account.dart';
import 'package:messenger/models/user.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  static final AppBloc singleton = AppBloc._internal();

  factory AppBloc() => singleton;

  AppBloc._internal() : super(Initial());

  void dispose() {
    singleton.close();
  }

  @override
  AppState get initialState => Initial();

  String token = '';
  String deviceId = '';
  late Account account;

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is TryAuthenticating) {
      // this.token = await StorageHelper.getToken();
      this.token = '123123';
      if (this.token.isEmpty) {
        yield NotAuthenticated();
      } else {
        yield (Authenticated());
      }
    }

    if (event is Logout) {
      yield Loading();
      // await StorageHelper.deleteToken();
      yield NotAuthenticated();
    }
  }
}
