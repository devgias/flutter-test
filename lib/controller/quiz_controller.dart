part of 'controllers.dart';

class QuizController extends GetxController {
  RxInt time = 30.obs;
  Timer? timer;

  void startTimer() {
    time.value = 30;
    timer = Timer.periodic(const Duration(seconds: 1),
        (Timer t) => time.value != 0 ? time-- : t.cancel());
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  @override
  void onInit() async {
    startTimer();
    super.onInit();
  }
}
