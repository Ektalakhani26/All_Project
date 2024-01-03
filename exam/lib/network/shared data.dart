import 'package:shared_preferences/shared_preferences.dart';

getvalue(String? username, String? pass) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString('name', username!);
  await pref.setString('name', pass!);
  print(pref.getString('name'));
}
