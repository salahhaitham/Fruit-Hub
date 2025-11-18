import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Features/Auth/domain/entites/UserEntity.dart';
import 'package:ecommerce_app/Features/Auth/domain/repos/AuthRepo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  AuthRepo authRepo;
  Future<void> SigninUserWithEmailandPassword(
    String email,
    String password,
    String username,
  ) async {
    if (state is SignInLoading) return;

    emit(SignInLoading());

    var result = await authRepo.SignInUserWithEmailAndPassword(
      email,
      password,
      username,
    );
    result.fold(
      (failure) => emit(SignInFailure(failure.errormessage)),
      (userentity) => emit(SignInSuccess(userentity)),
    );
  }

  Future<void> SigninUserWithGoogleAccount() async {
    if (state is SignInLoading) return;

    emit(SignInLoading());

    var result = await authRepo.SignInWithGoogle();
    result.fold(
      (failure) => emit(SignInFailure(failure.errormessage)),
      (userentity) => emit(SignInSuccess(userentity)),
    );
  }
  Future<void> SigninUserWithFacebook() async {
    if (state is SignInLoading) return;

    emit(SignInLoading());

    var result = await authRepo.SignInWithFacebook();
    result.fold(
          (failure) => emit(SignInFailure(failure.errormessage)),
          (userentity) => emit(SignInSuccess(userentity)),
    );
  }
}
