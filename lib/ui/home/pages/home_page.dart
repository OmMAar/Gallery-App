import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabed_test/blocs/gallery/gallery_bloc.dart';
import 'package:nabed_test/common/widgets/horizontal_padding.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';
import 'package:nabed_test/models/user/user_model.dart';
import 'package:nabed_test/utils/device/app_uitls.dart';
import 'package:nabed_test/utils/locale/app_localization.dart';
import 'package:provider/provider.dart';
import 'package:nabed_test/blocs/dashboard/dashboard_bloc.dart';
import 'package:nabed_test/common/widgets/base_body.dart';
import 'package:nabed_test/common/widgets/network_err.dart';
import 'package:nabed_test/common/widgets/unexpected_err.dart';
import 'package:nabed_test/common/widgets/vertical_padding.dart';
import 'package:nabed_test/constants/app_constants.dart';
import 'package:nabed_test/stores/language/language_store.dart';
import 'package:nabed_test/stores/theme/theme_store.dart';
import 'package:nabed_test/ui/home/widgets/home_app_bar_widget.dart';
import 'package:nabed_test/ui/home/widgets/shimmer/loading_home_widget.dart';
import 'package:nabed_test/utils/device/device_utils.dart';

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
    // TODO: implement initState
    super.initState();


    _bloc.add(GalleryEvent(cancelToken: _cancelToken,loadMore: false));
  }

  Widget _buildErrorWidget(String error, GalleryFailure state) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: error ==
                  'Connection to API server failed due to internet connection'
              ? NetworkError(onPressed: () {})
              : UnexpectedError()),
    );
  }

  Widget _buildLoadingWidget({required double width, required double height}) {
    return LoadingHomeWidget(width: width,height: height,);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserModel;
    AppBar appBar = AppBar(
      title: HomeAppBarWidget(name: args.fullName,),
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
        HorizontalPadding(percentage: 0.05,)
      ],
    );

    double widthC = DeviceUtils.getScaledWidth(context, 1);
    double heightC = DeviceUtils.getScaledHeight(context, 1) -
        appBar.preferredSize.height -
        MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      appBar: appBar,
      backgroundColor: AppColors.white,
      body: BlocListener<GalleryBloc, GalleryState>(
          bloc: _bloc,
          listener: (context, state) async {
            if (state is DashboardSuccess) {
              // result = state.result;
            }
            if (state is DashboardFailure) {
              AppUtils.showErrorMessage(context: context,message: "",title:AppLocalizations.of(context).translate('home_tv_error') );
              // final error = state.error;
              // if (error is ConnectionError) {
              //   ErrorViewerGet.showConnectionError(context, state.callback!);
              // } else if (error is CustomError) {
              //   ErrorViewerGet.showCustomError(context, error.message!);
              // } else {
              //   ErrorViewerGet.showUnexpectedError(context);
              // }
            }
          },
          child: BlocBuilder<GalleryBloc, GalleryState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is GalleryFailure)
                  return _buildErrorWidget(state.errorMessage, state);

                if (state is GalleryLoading)
                  return _buildLoadingWidget(height: heightC,width: widthC);
                if (state is GallerySuccess)
                  return _buildBody(height: heightC, width: widthC , result: state.result);

                return _buildLoadingWidget(height: heightC,width: widthC);
              })),
    );
  }

  Widget _buildBody({required double width, required double height, required List<HitsModel> result}) {
    return BaseBody(
      portraitWidget: _portraitWidget(height: height, width: width,result: result),
      landscapeWidget: _landscapeWidget(height: height, width: width, result: result),
      isSafeAreaTop: false,
    );
  }


  // portrait view:--------------------------------------------------------------
  Widget _portraitWidget({required double width, required double height,required List<HitsModel> result}) {
    return Container(
      height: height,
      width: width,
      child: Row(
        children: [

        ],
      ),
    );
  }

  // landscape view:--------------------------------------------------------------
  Widget _landscapeWidget({required double width, required double height,required List<HitsModel> result }) {
    return Container(
      height: height,
      width: width,
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimens.horizontal_padding),
      child: SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                VerticalPadding(
                  percentage: 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  @override
  void dispose() {
    // _cancelToken.cancel();
    // _bloc.close();
    super.dispose();
  }
}

