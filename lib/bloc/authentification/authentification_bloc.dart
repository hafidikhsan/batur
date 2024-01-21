import 'package:batur/domain/entities/sign_up_entity.dart';
import 'package:batur/domain/usecases/sign_up_usecase.dart';
import 'package:batur/utils/enumerate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentification_event.dart';
part 'authentification_state.dart';

class AuthentificationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  final SignUpUseCase emailSignUp;
  AuthentificationBloc(this.emailSignUp)
      : super(AuthentificationState.initial()) {
    on<OnEmailFormChanged>((event, emit) {
      final newEmail = event.email;

      emit(state.copyWith(
        email: newEmail,
      ));
    });

    on<OnFullNameFormChanged>((event, emit) {
      final newFullName = event.fullName;

      emit(state.copyWith(
        fullName: newFullName,
      ));
    });

    on<OnPasswordFormChanged>((event, emit) {
      final newPassword = event.password;

      emit(state.copyWith(
        password: newPassword,
      ));
    });

    on<OnPasswordDisplayChanged>((event, emit) {
      emit(state.copyWith(
        passwordDisplay: !state.passwordDisplay,
      ));
    });

    on<OnPasswordRepeatFormChanged>((event, emit) {
      final newPasswordRepeat = event.passwordRepeat;

      emit(state.copyWith(
        passwordRepeat: newPasswordRepeat,
      ));
    });

    on<OnPasswordRepeatDisplayChanged>((event, emit) {
      emit(state.copyWith(
        passwordRepeatDisplay: !state.passwordRepeatDisplay,
      ));
    });

    on<OnCleanForm>((event, emit) {
      emit(state.copyWith(
        passwordRepeatDisplay: true,
        passwordDisplay: true,
        email: "",
        fullName: "",
        password: "",
        passwordRepeat: "",
        status: AuthEnum.init,
      ));
    });

    on<OnEmailSignUp>((event, emit) async {
      emit(state.copyWith(
        status: AuthEnum.auth,
      ));

      final result = await emailSignUp.execute(SignUpEntity(
        name: state.fullName,
        email: state.email,
        password: state.password,
        repeatedPassword: state.passwordRepeat,
      ));

      result.fold(
        (failure) {
          emit(state.copyWith(
            status: AuthEnum.failed,
            message: failure.message,
          ));
        },
        (data) {
          emit(state.copyWith(
            status: AuthEnum.success,
            user: data.user,
          ));
          print(state.user);
        },
      );
    });
  }
}
