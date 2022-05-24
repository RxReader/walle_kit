import 'package:json_annotation/json_annotation.dart';

part 'channel_info.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class ChannelInfo {
  const ChannelInfo({
    required this.channel,
    this.extraInfo,
  });

  factory ChannelInfo.fromJson(Map<String, dynamic> json) =>
      _$ChannelInfoFromJson(json);

  final String channel;
  final Map<String, String>? extraInfo;

  Map<String, dynamic> toJson() => _$ChannelInfoToJson(this);
}
