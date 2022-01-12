
import 'package:timeago/timeago.dart' as timeago;

class DateHelper {
  static String getTimeAgo(int timestamp) {
    String result = '';
    print((DateTime.now().millisecondsSinceEpoch/1000).toInt());
    //1641720303

    // Format time stamp
    /*var date = DateTime.fromMillisecondsSinceEpoch(1641720303 * 1000);
    print(date);
    final df =  DateFormat('dd-MM-yyyy hh:mm:ss ');
    print(df.format(date));*/

    int distanceTime = (DateTime.now().millisecondsSinceEpoch/1000).toInt() - timestamp;

    timeago.setLocaleMessages('vi', timeago.ViMessages());
    timeago.setLocaleMessages('vi_short', timeago.ViShortMessages());

    final time = DateTime.now().subtract(Duration(seconds: distanceTime));
    result = timeago.format(time, locale: 'vi');

    // print(timeago.format(time, locale: 'vi_short'));


    return result;
  }
}