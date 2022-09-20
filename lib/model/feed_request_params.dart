import 'package:locals_demo/model/base_model.dart';
import 'package:locals_demo/model/json_mixin.dart';

enum FeedOrder {
  oldest,
  recent,
}

FeedOrder _feedOrderFromJson(String json) {
  for (var order in FeedOrder.values) {
    if (order.name == json) {
      return order;
    }
  }
  throw Exception();
}

abstract class _FeedRequestJsonKeys {
  static const String order = 'order';
  static const String pageId = 'lpid';
  static const String pageSize = 'page_size';
}

class FeedRequestParams extends BaseModel with JsonSerializable {
  FeedRequestParams({
    required this.order,
    required this.pageId,
    required this.pageSize,
  });

  factory FeedRequestParams.fromJson(Map<String, dynamic> json) {
    return FeedRequestParams(
      order: _feedOrderFromJson(json[_FeedRequestJsonKeys.order] as String),
      pageId: json[_FeedRequestJsonKeys.pageId] as int,
      pageSize: json[_FeedRequestJsonKeys.pageSize] as int,
    );
  }

  final FeedOrder order;
  final int pageId;
  final int pageSize;

  @override
  int get hashCode => order.hashCode ^ pageId.hashCode ^ pageSize.hashCode;

  @override
  bool operator ==(dynamic other) {
    if (other is FeedRequestParams) {
      return identical(this, other) || (order == other.order && pageId == other.pageId && pageSize == other.pageSize);
    }
    return false;
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      _FeedRequestJsonKeys.order: order.name,
      _FeedRequestJsonKeys.pageId: pageId,
      _FeedRequestJsonKeys.pageSize: pageSize,
    };
  }
}
