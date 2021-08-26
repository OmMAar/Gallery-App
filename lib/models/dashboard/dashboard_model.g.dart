// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) {
  return DashboardModel(
    allItems: json['allItems'] == null
        ? null
        : AllItemsModel.fromJson(json['allItems'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'allItems': instance.allItems,
    };

AllItemsModel _$AllItemsModelFromJson(Map<String, dynamic> json) {
  return AllItemsModel(
    momByStatusList: (json['momByStatusList'] as List<dynamic>?)
        ?.map((e) => MomByStatusListModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    actionByStatusList: (json['actionByStatusList'] as List<dynamic>?)
        ?.map((e) => MomByStatusListModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllItemsModelToJson(AllItemsModel instance) =>
    <String, dynamic>{
      'momByStatusList': instance.momByStatusList,
      'actionByStatusList': instance.actionByStatusList,
    };

MomByStatusListModel _$MomByStatusListModelFromJson(Map<String, dynamic> json) {
  return MomByStatusListModel(
    groupColor: json['groupColor'] as String?,
    groupName: json['groupName'] as String?,
    groupType: json['groupType'] as int?,
    groupItemsCount: json['groupItemsCount'] as int?,
  );
}

Map<String, dynamic> _$MomByStatusListModelToJson(
        MomByStatusListModel instance) =>
    <String, dynamic>{
      'groupColor': instance.groupColor,
      'groupName': instance.groupName,
      'groupType': instance.groupType,
      'groupItemsCount': instance.groupItemsCount,
    };
