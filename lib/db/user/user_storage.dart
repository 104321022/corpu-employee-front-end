import 'dart:convert';

import 'package:get_storage/get_storage.dart';

const String USER_BOX = 'user';

class UserStorage {
  UserStorage() {
    box = GetStorage(USER_BOX);
  }

  GetStorage? box;
}
