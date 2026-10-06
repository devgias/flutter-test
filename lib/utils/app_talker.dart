import 'package:flutter_test_quiz/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract class AppTalker {
  Talker get _talker;

  static Talker get talker => locator<AppTalker>()._talker;
}

@LazySingleton(as: AppTalker, env: [Environment.dev, Environment.test])
class $AppTalkerDev implements AppTalker {
  @override
  final Talker _talker = TalkerFlutter.init();
}

@LazySingleton(as: AppTalker, env: [Environment.prod])
class $AppTalkerProd implements AppTalker {
  @override
  final Talker _talker = TalkerFlutter.init(
    settings: TalkerSettings(useConsoleLogs: false),
  );
}
