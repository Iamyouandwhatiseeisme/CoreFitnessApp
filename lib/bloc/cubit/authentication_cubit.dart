import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final SupabaseClient _client = Supabase.instance.client;

  AuthenticationCubit() : super(AuthenticationInitial()) {
    debugPrint('AuthenticationCubit initialized');
    _client.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      final session = data.session;
      debugPrint('${event.toString()} event');

      if (event == AuthChangeEvent.signedIn && session?.user != null) {
        emit(AuthenticationSignedIn());
        debugPrint('signedIn ${session?.user.email}');
      } else if (event == AuthChangeEvent.signedOut) {
        debugPrint('signedout');
        emit(AuthenticationSignedOut());
      }
    });
    final currentUser = _client.auth.currentUser;
    if (currentUser != null) {
      emit(AuthenticationSignedIn());
    } else {
      emit(AuthenticationSignedOut());
    }
  }
  Future<void> signInWithGithub() async {
    debugPrint('signInWithGithub called');
    try {
      emit(AuthenticationSigningIn());
      debugPrint('Signing in with Github');

      await _client.auth.signInWithOAuth(
        OAuthProvider.github,
        redirectTo: kIsWeb ? null : 'corefitness://login-callback/',
        authScreenLaunchMode: kIsWeb
            ? LaunchMode.platformDefault
            : LaunchMode.externalApplication,
      );
      _client.auth.onAuthStateChange.listen((data) {
        final event = data.event;
        final session = data.session;
        debugPrint('${event.toString()} event');

        if (event == AuthChangeEvent.signedIn && session?.user != null) {
          emit(AuthenticationSignedIn());
          debugPrint('signedIn ${session?.user.email}');
        } else if (event == AuthChangeEvent.signedOut) {
          debugPrint('signedout');
          emit(AuthenticationSignedOut());
        }
      });
      final currentUser = _client.auth.currentUser;
      if (currentUser != null) {
        emit(AuthenticationSignedIn());
      } else {
        emit(AuthenticationSignedOut());
      }
      debugPrint('Signed in with Github');
    } on AuthException catch (e) {
      emit(AuthenticationSignInError(e.message));
    }
  }

  // Future<void> signInWithGithub() async {
  //   try {
  //     emit(AuthenticationSigningIn());

  //     await supabase.auth.signInWithOAuth(
  //       OAuthProvider.github,
  //       redirectTo: kIsWeb ? null : 'corefitness://com.example.core_fitness',
  //       authScreenLaunchMode: kIsWeb
  //           ? LaunchMode.platformDefault
  //           : LaunchMode.externalApplication,
  //     );
  //   } on AuthException catch (e) {
  //     emit(AuthenticationSignInError(e.message));
  //   }
  // }
}
