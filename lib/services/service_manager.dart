import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  late SharedPreferences pref;
  static const uidKey = 'uid_key';
  Future<bool> init() async {
    //Эгер тиркеме ачылганда uid ни оку
    pref = await SharedPreferences.getInstance();

    final uid = pref.getString(uidKey);
// if(uid !=null){
//   return true;
// }else{
//   return false;
// }

    // Эгер uid си бар болсо HomePage ке жибер
    // эгер uid жок болсо flash_chat ка жибер

    return uid != null;
  }

//Эген колдонуучу логин же регистрация болсо uid син кешке сактасын
  Future<void> setUid(String uid) async {
    await pref.setString(uidKey, uid);
  }

// Эгер колдонуучу logout  же delete  болсо uid си очуп калсын
  Future<void> removeUid() async {
    await pref.remove(uidKey);
  }
}

final userManager = UserManager();
