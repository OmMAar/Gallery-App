import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabed_test/blocs/gallery/gallery_bloc.dart';
import 'package:nabed_test/common/widgets/horizontal_padding.dart';
import 'package:nabed_test/common/widgets/network_err.dart';
import 'package:nabed_test/common/widgets/unexpected_err.dart';
import 'package:nabed_test/constants/app_constants.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';
import 'package:nabed_test/models/user/user_model.dart';
import 'package:nabed_test/stores/language/language_store.dart';
import 'package:nabed_test/stores/theme/theme_store.dart';
import 'package:nabed_test/ui/home/widgets/home_app_bar_widget.dart';
import 'package:nabed_test/ui/home/widgets/items/item_hit_widget.dart';
import 'package:nabed_test/ui/home/widgets/my_classic_footer.dart';
import 'package:nabed_test/ui/home/widgets/shimmer/loading_home_widget.dart';
import 'package:nabed_test/utils/device/app_uitls.dart';
import 'package:nabed_test/utils/device/device_utils.dart';
import 'package:nabed_test/utils/locale/app_localization.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;

  var _cancelToken = CancelToken();
  var _bloc = GalleryBloc();

  final _refresherController = RefreshController();
  final _scrollController = ScrollController();
  List<HitsModel> hits = [];
  int? _selectedIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //
    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  void initState() {
    // _scrollController.addListener(_scrollControllerListener);

    super.initState();

    _bloc.add(GalleryEvent(cancelToken: _cancelToken, loadMore: false));
  }

  void _scrollControllerListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent - 0.1.sh) {
      _onLoading();
    }
  }

  Widget _buildErrorWidget(String error, GalleryFailure state) {
    return Center(
      child: Container(
        color: AppColors.white,
        width: 250,
        height: 150,
        child: error ==
                'Connection to API server failed due to internet connection'
            ? NetworkError(onPressed: () {
                _bloc.add(
                    GalleryEvent(cancelToken: _cancelToken, loadMore: false));
                Navigator.pop(context);
              })
            : UnexpectedError(onPressed: () {
                _bloc.add(
                    GalleryEvent(cancelToken: _cancelToken, loadMore: false));
                Navigator.pop(context);
              }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserModel;
    AppBar appBar = AppBar(
      title: HomeAppBarWidget(
        name: args.fullName,
      ),
      backgroundColor: AppColors.white,
      brightness: Brightness.light,
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [
        Container(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: SvgPicture.asset(
                  AppAssets.search_svg,
                  width: 15,
                  height: 15,
                ),
              ),
            ),
          ),
        ),
        Container(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: SvgPicture.asset(
                  AppAssets.notification_svg,
                  width: 15,
                  height: 15,
                ),
              ),
            ),
          ),
        ),
        HorizontalPadding(
          percentage: 0.05,
        )
      ],
    );

    double widthC = DeviceUtils.getScaledWidth(context, 1);
    double heightC = DeviceUtils.getScaledHeight(context, 1) -
        appBar.preferredSize.height -
        MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      appBar: appBar,
      backgroundColor: AppColors.white,
      body: Container(
        width: widthC,
        height: heightC,
        child: BlocListener<GalleryBloc, GalleryState>(
            bloc: _bloc,
            listener: (context, state) async {
              if (state is GallerySuccess) {
                hits = state.result;
                _refresherController.loadComplete();
                _refresherController.refreshCompleted();
                if (state.noMoreData) {
                  AppUtils.showMessage(
                      message: AppLocalizations.of(context)
                          .translate('there_are_no_more_data'),
                      context: context,
                      title: "");
                }
              }
              if (state is GalleryFailure) {
                _refresherController.loadComplete();
                _refresherController.refreshCompleted();
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (_) =>
                        _buildErrorWidget(state.errorMessage, state));
                //AppUtils.showDialog(context: context, child: _buildErrorWidget(state.errorMessage, state));
                // AppUtils.showErrorMessage(
                //     context: context,
                //     message: "",
                //     title: AppLocalizations.of(context)
                //         .translate('home_tv_error'));
              }
            },
            child: BlocBuilder<GalleryBloc, GalleryState>(
                bloc: _bloc,
                builder: (context, state) {
                  return hits != null && hits.isNotEmpty
                      ? _buildBody(height: heightC, width: widthC, result: hits)
                      : state is GalleryLoading
                          ? Container(
                              child: LoadingHomeWidget(
                                width: widthC,
                                height: heightC,
                              ),
                            )
                          : Container(
                              child: Center(
                                  child: Text(AppLocalizations.of(context)
                                      .translate('no_data'))),
                            );

                  // return Container(
                  //   child: LoadingHomeWidget(
                  //     width: widthC,
                  //     height: heightC,
                  //   ),
                  // );
                })),
      ),
    );
  }

  void _onLoading() {
    _bloc.add(GalleryEvent(cancelToken: _cancelToken, loadMore: true));
  }

  _update() {
    if (mounted) {
      _bloc = GalleryBloc();
      setState(() {});
    }
  }

  Widget _buildBody(
      {required double width,
      required double height,
      required List<HitsModel> result}) {
    return SmartRefresher(
      controller: _refresherController,
      enablePullUp: true,
      onRefresh: () {
        _update();
        _bloc.add(GalleryEvent(cancelToken: _cancelToken, loadMore: false));
        // if (selectedRadio == 1) {
        //
        // } else {
        //   if (appConfig
        //       .notNullOrEmpty(fromData) &&
        //       appConfig
        //           .notNullOrEmpty(endDate)) {
        //     _update();
        //     _blocProvider.add(
        //         ProviderBillEvent(
        //             refNo: _insuredName,
        //             cardCode: _visitNumber,
        //             visitType: _typeSpecialty?.iD?.t??'',
        //             providerId:
        //             args.data.iD.t ?? '',
        //             all: selectedRadio == 1,
        //             fromDate: fromData,
        //             toDate: endDate,
        //             loadMore: false));
        //   } else {
        //     appConfig.showToast(
        //         msg: Translations.of(context)
        //             .translate(
        //             'please_select_from_and_to_date'));
        //   }
        // }
      },
      onLoading: _onLoading,
      header: MaterialClassicHeader(
        color: AppColors.mainColor,
      ),
      footer: MyClassicFooter(),
      child: _viewWidget(height: height, width: width, result: result),
    );
  }

  // portrait view:--------------------------------------------------------------
  Widget _viewWidget(
      {required double width,
      required double height,
      required List<HitsModel> result}) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollEnd) {
        var metrics = scrollEnd.metrics;
        if (metrics.atEdge) {
          if (metrics.pixels == 0)
            print('At top');
          else {
            _onLoading();
            print('At bottom');
          }
        }
        return true;
      },
      child: _buildListItem(width: width, height: height, result: result),
    );
  }

  _buildListItem(
      {required double width,
      required double height,
      required List<HitsModel> result}) {
    return Padding(
        padding: const EdgeInsets.all(4),
        child: AnimationLimiter(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) =>
                AnimationConfiguration.staggeredGrid(
                    columnCount: result.length,
                    position: index,
                    duration: const Duration(milliseconds: 1000),
                    delay: Duration(milliseconds: 500),
                    child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                            child: ItemHitWidget(
                                width: width, item: result[index])))),
            itemCount: result.length,
            shrinkWrap: true,
            // padding: const EdgeInsets.only(
            //     left: App.subSubMin, right: EdgeMargin.subSubMin),
            physics: BouncingScrollPhysics(),
          ),
        ));
  }

  void _handleSelectedItemChanged(int index) {
    setState(() {
      _selectedIndex = _selectedIndex == index ? null : index;
    });
  }

  @override
  void dispose() {
    _cancelToken.cancel();
    _bloc.close();
    _refresherController.dispose();
    _scrollController.removeListener(_scrollControllerListener);
    _scrollController.dispose();
    super.dispose();
  }
}
