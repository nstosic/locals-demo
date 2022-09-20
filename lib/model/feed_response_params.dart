import 'dart:convert';

import 'package:locals_demo/model/base_model.dart';
import 'package:locals_demo/model/feed_item.dart';
import 'package:locals_demo/model/json_mixin.dart';

abstract class _FeedResponseJsonKeys {
  static const String data = 'data';
}

class FeedResponseParams extends BaseModel with JsonSerializable {
  FeedResponseParams({required this.feed});

  final List<FeedItem> feed;

  factory FeedResponseParams.fromJson(Map<String, dynamic> json) {
    return FeedResponseParams(
        feed: (json[_FeedResponseJsonKeys.data] as List)
            .cast<Map<String, dynamic>>()
            .map((item) => FeedItem.fromJson(item))
            .toList());
  }

  @override
  int get hashCode => feed.hashCode;

  @override
  bool operator ==(dynamic other) {
    if (other is FeedResponseParams) {
      return identical(this, other) || feed == other.feed;
    }
    return false;
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      _FeedResponseJsonKeys.data: feed.map((item) => item.toJson()).toList(),
    };
  }
}
