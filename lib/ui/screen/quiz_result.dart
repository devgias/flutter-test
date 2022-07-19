part of 'screens.dart';

class QuizResult extends StatelessWidget {
  final List<QuizModel> quiz;
  const QuizResult({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: secondaryOneColor,
        appBar: AppBar(
          backgroundColor: secondaryOneColor,
          elevation: 0,
          title: Text(
            'Quiz Result',
            style: appTitle.copyWith(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextButton(
                onPressed: () => Get.to(() => const HomeScreen()),
                child: Text(
                  'Keluar',
                  style: subtTitle.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Quiz Selesai',
                      style:
                          subtTitle.copyWith(color: Colors.white, fontSize: 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset(
                              'assets/star${(quiz.where((element) => element.answered!).toList().length / quiz.length) * 100 > 0 ? 'fill' : 'blank'}.png'),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset(
                              'assets/star${(quiz.where((element) => element.answered!).toList().length / quiz.length) * 100 >= 80 ? 'fill' : 'blank'}.png'),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset(
                              'assets/star${(quiz.where((element) => element.answered!).toList().length / quiz.length) * 100 >= 90 ? 'fill' : 'blank'}.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Nilai Anda :',
                      style:
                          subtTitle.copyWith(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      ((quiz
                                      .where((element) => element.answered!)
                                      .toList()
                                      .length /
                                  quiz.length) *
                              100)
                          .toInt()
                          .toString(),
                      style: title.copyWith(color: Colors.white, fontSize: 50),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
