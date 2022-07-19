import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_app/controller/controllers.dart';
import 'package:modul_app/model/models.dart';
import 'package:modul_app/ui/screen/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HomeController());
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool? modeQuiz;

  Future<bool> setUp() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('modequiz') ?? false;
  }

  @override
  void initState() {
    setUp().then((value) => setState(() {
          modeQuiz = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: (modeQuiz ?? false)
          ? QuizScreen(
              quiz: mockQuiz,
              index: 0,
            )
          : const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
