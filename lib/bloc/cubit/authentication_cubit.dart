import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    debugPrint('triggered signInWithEmail');
    try {
      final AuthResponse res = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      debugPrint(res.toString());

      emit(AuthenticationSignedIn());
    } on AuthException catch (e) {
      debugPrint(e.message);
      emit(AuthenticationSignInError(e.message));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      debugPrint('signInWithGoogle called');
      final webClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID'];
      debugPrint(webClientId);

      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      _client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      emit(AuthenticationSignedIn());
    } on AuthException catch (e) {
      emit(AuthenticationSignInError(e.message));
    }
  }
}
