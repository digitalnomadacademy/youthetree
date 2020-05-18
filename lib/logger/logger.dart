import 'package:simple_logger/simple_logger.dart';

final l = SimpleLogger()..setLevel(_logLevel, includeCallerInfo: true);

Level _logLevel = Level.WARNING;
