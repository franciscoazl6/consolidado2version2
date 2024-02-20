import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController{
  var data = GetStorage().read("success");
  void infoSession(){
  GetStorage().remove("success");
  Get.toNamed("/");
  }
  void goToInfoPage() {
    Get.toNamed('/info');
  }
  void goToDataPage() {
    Get.toNamed('/data');
  }
  void goToChatPage() {
    Get.toNamed('/chat');
  }
  void goToDatePage() {
    Get.toNamed('/date');
  }
}