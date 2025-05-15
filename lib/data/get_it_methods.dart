import 'package:core_fitness/main.dart';
import 'package:core_fitness/presentation/widgets/navigation/navigator_client.dart';
import 'package:google_sign_in/google_sign_in.dart';

void setUp() {
  sl.registerSingleton<NavigatorClient>(NavigatorClient());
  sl.registerSingleton<GoogleSignIn>(GoogleSignIn());
}
