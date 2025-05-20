import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SupabaseClient _client = Supabase.instance.client;

  SignUpCubit() : super(SignUpInitial());
  Future<void> signUpNewUser({
    required String email,
    required String password,
  }) async {
    debugPrint('signUpNewUser called');
    emit(SigningUp());
    try {
      await _client.auth.signUp(email: email, password: password);
      _client.auth.signOut();

      emit(SignedUp());
    } on AuthApiException catch (e) {
      debugPrint(e.message);
      emit(SignUpError(e.message));
    }
  }
}
