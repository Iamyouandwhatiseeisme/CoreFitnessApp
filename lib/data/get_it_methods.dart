import 'package:core_fitness/main.dart';
import 'package:core_fitness/presentation/widgets/navigation/navigator_client.dart';

void setUp() {
  sl.registerSingleton<NavigatorClient>(NavigatorClient());
}
