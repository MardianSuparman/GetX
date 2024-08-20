import 'package:get/get.dart';
// import 'package:get_cli/common/utils/json_serialize/sintaxe.dart';

class CounterController extends GetxController {
  var bilangan = 0.obs;

  void increment() {
    if (bilangan.value >= 20) {
      Get.snackbar('Warning', 'Tos Seuer Jang');
    } else {
      bilangan.value++;
    }
  }
  void decrement() {
    if (bilangan.value <= 0) {
      Get.snackbar('Warning', 'Tos Seep Jang Hayoh we Dicandak');
    } else {
      bilangan.value--;
    }
  }
}
