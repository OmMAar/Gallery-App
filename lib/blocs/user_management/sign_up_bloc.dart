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

abstract class SignUpState extends Equatable {}

class SignUpUninitialized extends SignUpState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'SignUpUninitialized';
}

class SignUpLoading extends SignUpState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'SignUpLoading';
}

class SignUpSuccess extends SignUpState {
  final UserModel result;

  SignUpSuccess({required this.result});

  @override
  List<Object> get props => [result];

  @override
  String toString() => 'SignUpSuccess data :${result.toJson()}';
}

class SignUpFailure extends SignUpState {
  final String errorMessage;
  final VoidCallback? callback;

  SignUpFailure({
    required this.errorMessage,
    this.callback,
  });

  @override
  List<Object> get props => [errorMessage, callback!];

  @override
  String toString() => 'SignUpFailure { error: $errorMessage }';
}

// abstract class SignUpEvent extends Equatable {}

class SignUpEvent extends Equatable {
  final String email;
  final String fullName;
  final String password;

  SignUpEvent(
      {required this.fullName, required this.password, required this.email});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SignUpEvent';
}

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpUninitialized());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    // repository instance
    Repository _repository = getIt<Repository>();

    yield SignUpLoading();

    try {
      final result = await _repository.createNewAccount(
          newUser: UserModel(
              password: event.password,
              fullName: event.fullName,
              email: event.email));

      yield SignUpSuccess(result: result);
    } catch (err) {
      print('Caught error: $err');
      if(err is DioError){
        yield SignUpFailure(
          errorMessage: DioErrorUtil.handleError(err),
          callback: () {
            this.add(event);
          },
        );
      }else if(err is DatabaseException){
        yield SignUpFailure(
          errorMessage: DataBaseErrorUtil.handleError(err),
          callback: () {
            this.add(event);
          },
        );
      }else {
        yield SignUpFailure(
          errorMessage: err.toString(),
          callback: () {
            this.add(event);
          },
        );
      }

    }
  }
}
