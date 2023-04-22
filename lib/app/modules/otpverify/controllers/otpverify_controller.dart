import 'package:get/get.dart';
import 'dart:async';
import 'date_formatter.dart';
class OtpverifyController extends GetxController {
  RxString elapsedTime = '01:00'.obs;
  int _start = 60;
  late Timer _timer;
  //TODO: Implement OtpverifyController
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start < 1) {
        timer.cancel();
        elapsedTime.value = '00:00';
      } else {
        _start = _start - 1;
        elapsedTime.value = DateFormatter.formatSecondsToString(_start);
      }
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
     startTimer();
    super.onInit();
  }

 
  @override
  void onClose() {}
  void increment() => count.value++;
}
