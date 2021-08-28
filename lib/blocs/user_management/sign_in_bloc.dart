import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nabed_test/data/repository.dart';
import 'package:nabed_test/di/components/service_locator.dart';
import 'package:nabed_test/models/user/user_model.dart';
import 'package:nabed_test/utils/database_exception/database_error_util.dart';
import 'package:nabed_test/utils/handel_error/dio_error_util.dart';
import 'package:sqflite/sqflite.dart';

abstract class SignInState extends Equatable {}

class SignInUninitialized extends SignInState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'SignInUninitialized';
}

class SignInLoading extends SignInState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'SignInLoading';
}

class SignInSuccess extends SignInState {
final UserModel result;
SignInSuccess({required this.result});

  @override
  List<Object> get props => [result];

  @override
  String toString() => 'SignInSuccess data: $result';
}

class SignInFailure extends SignInState {
  final String errorMessage;
  final VoidCallback? callback;

  SignInFailure({
    required this.errorMessage,
    this.callback,
  });

  @override
  List<Object> get props => [errorMessage, callback!];

  @override
  String toString() => 'SignInFailure { error: $errorMessage }';
}

// abstract class SignInEvent extends Equatable {}

class SignInEvent extends Equatable {
  final String email;
  final String password;

  SignInEvent(
      {required this.password, required this.email});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SignInEvent';
}

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInUninitialized());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    // repository instance
    Repository _repository = getIt<Repository>();

    yield SignInLoading();

    try {
      final result = await _repository.accountExists(
        password: event.password,
        email: event.email
          );

      if(result!=null){
        yield SignInSuccess(result: result);
      }else{
        yield SignInFailure(
          errorMessage: "Account isn't exists",
          callback: () {
            this.add(event);
          },
        );
      }


    } catch (err) {
      print('Caught error: $err');
      if(err is DioError){
        yield SignInFailure(
          errorMessage: DioErrorUtil.handleError(err),
          callback: () {
            this.add(event);
          },
        );
      }else if(err is DatabaseException){
        yield SignInFailure(
          errorMessage: DataBaseErrorUtil.handleError(err),
          callback: () {
            this.add(event);
          },
        );
      }else {
        yield SignInFailure(
          errorMessage: err.toString(),
          callback: () {
            this.add(event);
          },
        );
      }

    }
  }
}
