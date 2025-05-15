import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final SupabaseClient supabase;

  AuthenticationCubit()
    : supabase = Supabase.instance.client,
      super(AuthenticationInitial());

  Future<void> signInWithGithub() async {
    try {
      emit(AuthenticationSigningIn());

      await supabase.auth.signInWithOAuth(
        OAuthProvider.github,
        redirectTo: kIsWeb ? null : 'corefitness://com.example.core_fitness',
        authScreenLaunchMode: kIsWeb
            ? LaunchMode.platformDefault
            : LaunchMode.externalApplication,
      );
      emit(AuthenticationSignedIn());
    } on AuthException catch (e) {
      emit(AuthenticationSignInError(e.message));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(AuthenticationSigningIn());
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: kIsWeb ? null : 'corefitness://login-callback',
        authScreenLaunchMode: kIsWeb
            ? LaunchMode.platformDefault
            : LaunchMode.externalApplication,
      );
      emit(AuthenticationSignedIn());
    } on AuthException catch (e) {
      emit(AuthenticationSignInError(e.message));
    }
  }
}
