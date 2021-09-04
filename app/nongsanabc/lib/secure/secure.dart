import 'dart:convert';

import 'package:crypto/crypto.dart';

class Secure {
  String criptString(String passWord) {
    String rs = "";
    var bytes = utf8.encode(passWord); // data being hashed

    var digest = sha1.convert(bytes);
    rs = digest.toString();
    return rs;
  }
}
