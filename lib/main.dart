import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_quiz/core/core.dart';
import 'package:flutter_test_quiz/my_app.dart';
import 'package:flutter_test_quiz/utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

const _environment = Environment.dev;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  initInjector(_environment);

  Bloc.observer = TalkerBlocObserver(talker: AppTalker.talker);

  runApp(const MyApp());
}
