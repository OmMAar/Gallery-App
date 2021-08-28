import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nabed_test/data/network/constants/endpoints.dart';
import 'package:nabed_test/data/repository.dart';
import 'package:nabed_test/di/components/service_locator.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';
import 'package:nabed_test/utils/database_exception/database_error_util.dart';
import 'package:nabed_test/utils/handel_error/dio_error_util.dart';
import 'package:sqflite/sqflite.dart';

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

  GallerySuccess({required this.result, this.noMoreData = false});

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


class GalleryEvent extends Equatable {
  final bool loadMore;
  final CancelToken cancelToken;

  GalleryEvent({this.loadMore = false, required this.cancelToken});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'GalleryEvent loadMore $loadMore';
}

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  List<HitsModel> hits = [];
  int page = 1;

  GalleryBloc() : super(GalleryUninitialized());

  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    // repository instance
    Repository _repository = getIt<Repository>();

    try {
      if (event.loadMore) {
        this.page++;
        print('event.loadMore');
      } else {
        page = 1;
        yield GalleryLoading();
      }

      final galleryResult = await _repository.getGalleryItems(
          page: page, pageSize: Endpoints.pageSize, key: Endpoints.apiKey);

      if (galleryResult.isNotEmpty) {
        if (event.loadMore) {
          List<HitsModel> hitsListTemp = List.from(this.hits);
          hitsListTemp.addAll(galleryResult);
          await Future.delayed(Duration(seconds: 3), () {});
          this.hits = hitsListTemp;
        }
        else {
          await Future.delayed(Duration(seconds: 1), () {});
          this.hits = galleryResult;
        }
        yield GallerySuccess(result: this.hits);
      } else {
        if (event.loadMore) {
          page --;
        }
        if (this.hits.isEmpty) {
          yield GalleryFailure(errorMessage: "There are no data",callback: () {
            this.add(event);
          },);
        } else {

          yield GallerySuccess(result: this.hits);
        }
      }
    } catch (err) {
      print('Caught error: $err');
      if(err is DioError){
        yield GalleryFailure(
          errorMessage: DioErrorUtil.handleError(err),
          callback: () {
            this.add(event);
          },
        );
      }else if(err is DatabaseException){
        yield GalleryFailure(
          errorMessage: DataBaseErrorUtil.handleError(err),
          callback: () {
            this.add(event);
          },
        );
      }else {
        yield GalleryFailure(
          errorMessage: err.toString(),
          callback: () {
            this.add(event);
          },
        );
      }
    }
  }
}
