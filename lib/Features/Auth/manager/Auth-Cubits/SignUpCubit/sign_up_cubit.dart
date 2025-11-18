import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Features/Auth/domain/entites/UserEntity.dart';
import 'package:ecommerce_app/Features/Auth/domain/repos/AuthRepo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  AuthRepo authRepo;
  Future<void>CreateUserWithEmailandPassword(String email,String password,String username)async{
    if (state is SignUpLoading) return;

    emit(SignUpLoading());

    var result=await authRepo.CreateUserWithEmailAndPassword(email, password,username);
     result.fold(
             (failure)=>emit(SignUpFailure(failure.errormessage)),
             (userentity)=>emit(SignUpSucces(userentity))
     );



  }
}
