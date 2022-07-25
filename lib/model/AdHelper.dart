import 'dart:io';

class AdHelper {
  static String bannnerAD() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3217292006726724/9386877186";
    } else {
      return "";
    }
  }

  static String intertistialAD() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3217292006726724/7964902738";
    } else {
      return "";
    }
  }

  static String openappAD() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3217292006726724/3044795039";
    } else {
      return "";
    }
  }
}
