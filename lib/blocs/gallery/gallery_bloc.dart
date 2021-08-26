import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nabed_test/data/repository.dart';
import 'package:nabed_test/di/components/service_locator.dart';
import 'package:nabed_test/models/dashboard/dashboard_model.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';
import 'package:nabed_test/utils/dio/dio_error_util.dart';


abstract class GalleryState extends Equatable {}

class GalleryUninitialized extends GalleryState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'GalleryUninitialized';
}

class GalleryLoading extends GalleryState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'GalleryLoading';
}

class GallerySuccess extends GalleryState {
 final List<HitsModel> result;
 final bool noMoreData;

   GallerySuccess({required this.result,this.noMoreData = false});
  @override
  List<Object> get props => [result];

  @override
  String toString() => 'GallerySuccess data :${result.length}';
}

class GalleryFailure extends GalleryState {
  final String errorMessage;
  final VoidCallback? callback;

  GalleryFailure({
    required this.errorMessage,
    this.callback,
  });

  @override
  List<Object> get props => [errorMessage, callback!];

  @override
  String toString() => 'GalleryFailure { error: $errorMessage }';
}

// abstract class GalleryEvent extends Equatable {}

class GalleryEvent extends Equatable {

  bool loadMore;
  final CancelToken cancelToken;

  GalleryEvent({this.loadMore = false,required this.cancelToken});


  @override
  List<Object> get props => [];

  @override
  String toString() => 'GalleryEvent loadMore $loadMore';
}

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(GalleryUninitialized());



  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {

    List<HitsModel> hits = [];
    int page = 0;


    // repository instance
    Repository _repository = getIt<Repository>();

    try {

      if (event.loadMore) {
        page++;
        print('event.loadMore');
      }

      else {
        page = 0;
        yield GalleryLoading();
      }

      final future = await _repository.getGalleryItems(page: page, pageSize: 10, key: '23086641-04f8751d38ce8bd30a872d6e2');

      yield GallerySuccess(result: future.hits!);
    } catch (err) {
      print('Caught error: $err');
      yield GalleryFailure(
        errorMessage: DioErrorUtil.handleError(err as DioError),
        callback: () {
          this.add(event);
        },
      );
    }
  }
}
