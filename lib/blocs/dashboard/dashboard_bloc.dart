import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nabed_test/data/repository.dart';
import 'package:nabed_test/di/components/service_locator.dart';
import 'package:nabed_test/models/dashboard/dashboard_model.dart';
import 'package:nabed_test/utils/dio/dio_error_util.dart';


abstract class DashboardState extends Equatable {}

class DashboardUninitialized extends DashboardState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DashboardUninitialized';
}

class DashboardLoading extends DashboardState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DashboardLoading';
}

class DashboardSuccess extends DashboardState {
 final DashboardModel result;

   DashboardSuccess({required this.result});
  @override
  List<Object> get props => [result];

  @override
  String toString() => 'DashboardSuccess data :${result.toJson()}';
}

class DashboardFailure extends DashboardState {
  final String errorMessage;
  final VoidCallback? callback;

  DashboardFailure({
    required this.errorMessage,
    this.callback,
  });

  @override
  List<Object> get props => [errorMessage, callback!];

  @override
  String toString() => 'DashboardFailure { error: $errorMessage }';
}

// abstract class DashboardEvent extends Equatable {}

class DashboardEvent extends Equatable {


  @override
  List<Object> get props => [];

  @override
  String toString() => 'DashboardEvent';
}

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardUninitialized());



  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    // repository instance
    Repository _repository = getIt<Repository>();


    yield DashboardLoading();


    try {
      final future = await _repository.getDashboardInfo();

      yield DashboardSuccess(result: future);
    } catch (err) {
      print('Caught error: $err');
      yield DashboardFailure(
        errorMessage: DioErrorUtil.handleError(err as DioError),
        callback: () {
          this.add(event);
        },
      );
    }



    // yield await _repository.getDashboardInfo(params: {
    //   'id': '292223',
    //   'appid': '6b8c1510f8cf4cbbfbbdcc4e7370ff21'
    // }).then((response) {
    //   return DashboardSuccess(result: response);
    // }).catchError((error) {
    //   return  DashboardFailure(
    //     errorMessage: DioErrorUtil.handleError(error),
    //     callback: () {
    //       this.add(event);
    //     },
    //   );
    // });
    //
    // future.then((postList){
    //   //    this.postList = postList;
    //   return DashboardSuccess(result: postList);
    // }).catchError((error) {
    //   // ignore: return_of_invalid_type_from_catch_error
    //   return DashboardFailure(
    //     errorMessage: DioErrorUtil.handleError(error),
    //     callback: () {
    //       this.add(event);
    //     },
    //   );
    //   //  errorStore.errorMessage = DioErrorUtil.handleError(error);
    // });
    // yield DashboardLoading();
    // final result = await DashboardUseCase(locator<UserRepository>())(
    //   DashboardParams(
    //     queryParams: DashboardRequest(
    //       username: event.email,
    //     ),
    //     cancelToken: event.cancelToken,
    //   ),
    // );
    // if (result.hasDataOnly) {
    //   yield DashboardSuccess();
    // }
    // if (result.hasErrorOnly) {
    //   yield DashboardFailure(
    //     error: result.error!,
    //     callback: () {
    //       this.add(event);
    //     },
    //   );
    // }
  }
}
