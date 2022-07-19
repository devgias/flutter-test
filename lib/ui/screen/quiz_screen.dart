part of 'screens.dart';

class QuizScreen extends StatelessWidget {
  final controller = Get.put(QuizController());
  List<QuizModel> quiz;
  final int index;
  QuizScreen({Key? key, required this.index, required this.quiz})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: secondaryOneColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: secondaryOneColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Quiz',
            style: appTitle.copyWith(color: Colors.white),
          ),
          actions: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10),
              child: Obx(() => Text(
                    controller.time.value.toString(),
                    style: subtTitle.copyWith(color: Colors.white),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextButton(
                onPressed: () => showDialog<String>(
                    context: context,
                    builder: (context) => _confirmDialog(context)),
                child: Text(
                  'Keluar',
                  style: subtTitle.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    quiz[index].question!,
                    style: subtTitle.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: quiz[index]
                        .options!
                        .map((e) => QuizOpsi(
                            opsi: e,
                            ontap: () {
                              quiz[index] = QuizModel(
                                  id: quiz[index].id,
                                  options: quiz[index].options,
                                  question: quiz[index].question,
                                  trueAnswer: quiz[index].trueAnswer,
                                  selectedAnswer: e,
                                  answered: quiz[index].options!.indexOf(e) ==
                                      quiz[index].trueAnswer);
                              controller.timer?.cancel();
                              showDialog<String>(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => WillPopScope(
                                        child: resultDialog(
                                            context,
                                            quiz[index].options!.indexOf(e) ==
                                                quiz[index].trueAnswer,
                                            e,
                                            correctAnswer: quiz[index].options![
                                                quiz[index].trueAnswer!]),
                                        onWillPop: () => Future.value(false),
                                      ));
                            }))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  _confirmDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Keluar",
        style: title,
      ),
      content: Text(
        'Apakah anda yakin keluar dari quiz sekarang dan tidak mendapatkan nilai',
        style: subtTitle,
      ),
      actions: [
        TextButton(
            onPressed: () async {
              final pref = await SharedPreferences.getInstance();
              pref.setBool('modequiz', false);
              Get.delete<QuizController>();
              Get.offAll(() => const HomeScreen());
            },
            child: Text(
              "YES",
              style: subtTitle.copyWith(color: Colors.green[400]),
            )),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "NO",
              style: subtTitle.copyWith(color: Colors.red[400]),
            )),
      ],
    );
  }

  resultDialog(BuildContext context, bool isTrue, String answer,
      {String? correctAnswer}) {
    return AlertDialog(
      title: Text(
        isTrue ? "Benar" : "Salah",
        textAlign: TextAlign.center,
        style: title,
      ),
      scrollable: false,
      content: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 400,
        child: Column(
          mainAxisAlignment: isTrue
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Jawaban anda :",
              textAlign: TextAlign.center,
              style: subtTitle,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: isTrue ? Colors.green[800] : Colors.red[600]),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  answer,
                  style: subtTitle.copyWith(color: Colors.white),
                ),
              ),
            ),
            isTrue
                ? const SizedBox()
                : Column(
                    children: [
                      Text(
                        "Jawaban yang benar :",
                        textAlign: TextAlign.center,
                        style: subtTitle,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.green[600]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            correctAnswer!,
                            style: subtTitle.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 56, 111, 156)),
          ),
          icon: const Icon(Icons.arrow_circle_right_outlined,
              color: Colors.white),
          label: Text(
            "Lanjut",
            style: generalText.copyWith(color: Colors.white),
          ),
          onPressed: () {
            index + 1 < quiz.length
                ? Get.offAll(() => QuizScreen(
                      quiz: quiz,
                      index: index + 1,
                    ))
                : Get.offAll(() => QuizResult(
                      quiz: quiz,
                    ));
            controller.startTimer();
          },
        )
      ],
    );
  }
}
