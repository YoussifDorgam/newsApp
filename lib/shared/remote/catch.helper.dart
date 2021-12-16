import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cachHelper
{
static late SharedPreferences sharedPreferences ;


static  init()
async{
  sharedPreferences = await SharedPreferences.getInstance();
}

static Future<bool> putdata({
  required String key,
  required bool value,

})
async{
  return await sharedPreferences.setBool(key, value);

}




static bool? getdata({
  required String key,
})
 {
  return sharedPreferences.getBool(key);

}

}

