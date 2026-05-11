import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_it/core/Networks/api_error.dart';
import 'package:rent_it/core/utils/pref_Helpers.dart';
import 'package:rent_it/features/Auth/Data/auth_repo.dart';
import 'package:rent_it/features/Auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthIntialState());
  final AuthRepo authRepo = AuthRepo();

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());

    try {
      final user = await authRepo.login(email, password);
      if (user != Null) {
        emit(AuthSuccessState());
      } else {
        emit(AuthFailureState(errmsg: " User equal Null"));
      }
    } catch (e) {
      if (e is ApiError) {
        emit(AuthFailureState(errmsg: e.message));
      } else {
        emit(AuthFailureState(errmsg: e.toString()));
      }
    }
  }

  Future<void> checkAuthStatus() async {
    emit(AuthLoadingState());

    final token = await PrefHelper.getToken();

    if (token != null && token.isNotEmpty && token != 'guest') {
      emit(AuthAuthenticatedState());
    } else {
      emit(AuthUnauthenticatedState());
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoadingState());

    try {
      await authRepo.register(name, email, password, confirmPassword);
      emit(AuthSuccessState());
    } catch (e) {
      if (e is ApiError) {
        emit(AuthFailureState(errmsg: e.message));
      } else {
        emit(AuthFailureState(errmsg: e.toString()));
      }
      // TODO
    }
  }
}
