part of 'screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<List> setUp() async {
    final pref = await SharedPreferences.getInstance();
    return [
      pref.getBool('modequiz') ?? false,
      pref.getInt('quizid') ?? 0,
    ];
  }

  @override
  void initState() {
    setUp().then(
      (value) => Timer(
        const Duration(seconds: 3),
        () => value[0]
            ? Get.offAll(
                () => QuizScreen(),
                transition: Transition.cupertino,
                arguments: value[1],
              )
            : Get.offAll(
                () => const HomeScreen(),
                transition: Transition.cupertino,
              ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xff1F1D2B),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 130,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/file.png'),
                        fit: BoxFit.contain)),
              ),
              const SizedBox(height: 20),
              const Text(
                'Modul',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      );
}
