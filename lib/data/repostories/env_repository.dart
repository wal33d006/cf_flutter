import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvRepository {
  String getEnvironmentVariableByKey(String key) => dotenv.env[key] ?? 'DEMO_KEY';
}
