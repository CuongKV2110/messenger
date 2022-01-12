import 'package:bloc/bloc.dart';
import 'package:messenger/bloc/setting/setting_event.dart';
import 'package:messenger/bloc/setting/setting_state.dart';

const String SETTING_LOCALE = 'setting_locale';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  static final SettingBloc singleton = SettingBloc._internal();

  factory SettingBloc() => singleton;

  SettingBloc._internal() : super(SettingInitial());

  // SharedPreferences prefs;
  // String locale = AppSetting.LOCALE_EN;
  String locale = 'vi';

  void dispose() {
    singleton.close();
  }

  @override
  SettingState get initialState => SettingInitial();

  @override
  Stream<SettingState> mapEventToState(SettingEvent event) async* {
    if (event is LoadSetting) {
      // prefs = await SharedPreferences.getInstance();
      // locale = prefs.getString(SETTING_LOCALE) ?? AppSetting.LOCALE_EN;
      locale = 'en';
      yield SettingLoaded();
    }

    if (event is UpdateSetting) {
      locale = event.locale;
      yield SettingUpdated();
    }

    if (event is StoreSetting) {
      // await Future.wait([
      //   prefs.setString(SETTING_LOCALE, locale),
      // ]);
      // TODO: Call API
      yield SettingStored();
    }
  }
}
