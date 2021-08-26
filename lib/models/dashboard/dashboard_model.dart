import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel {
  final AllItemsModel? allItems;
  // final TodayItems? todayItems;

 const DashboardModel({this.allItems});
  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);

}

@JsonSerializable()
class AllItemsModel {
 final List<MomByStatusListModel>? momByStatusList;
  final List<MomByStatusListModel>? actionByStatusList;

 const AllItemsModel({this.momByStatusList, this.actionByStatusList});

 factory AllItemsModel.fromJson(Map<String, dynamic> json) =>
     _$AllItemsModelFromJson(json);

 Map<String, dynamic> toJson() => _$AllItemsModelToJson(this);

}
@JsonSerializable()
class MomByStatusListModel {
  final String? groupColor;
  final String? groupName;
  final int? groupType;
  final int? groupItemsCount;

 const MomByStatusListModel(
      {this.groupColor, this.groupName, this.groupType, this.groupItemsCount});

  factory MomByStatusListModel.fromJson(Map<String, dynamic> json) =>
      _$MomByStatusListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MomByStatusListModelToJson(this);
}

