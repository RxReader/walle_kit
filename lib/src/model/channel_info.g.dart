// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelInfo _$ChannelInfoFromJson(Map<String, dynamic> json) => ChannelInfo(
      channel: json['channel'] as String,
      extraInfo: (json['extra_info'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$ChannelInfoToJson(ChannelInfo instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'extra_info': instance.extraInfo,
    };
