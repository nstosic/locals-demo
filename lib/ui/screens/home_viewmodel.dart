import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:locals_demo/injector_helper.dart';
import 'package:locals_demo/model/feed_item.dart';
import 'package:locals_demo/model/feed_request_params.dart';
import 'package:locals_demo/ui/base/base_viewmodel.dart';
import 'package:locals_demo/usecase/feed_request_usecase.dart';
import 'package:locals_demo/utils/constants.dart';

class HomeViewModel extends BaseViewModel {
  final List<FeedItem> feed = [];

  FeedOrder _feedOrder = FeedOrder.recent;
  FeedOrder get feedOrder => _feedOrder;

  int _pageId = 0;
  List<int> indices = <int>[0];

  late FeedRequestUsecase feedUsecase;

  @override
  FutureOr<void> init() async {
    InjectorHelper.injectHomeViewModelDependency(this);
    busy = true;
    notifyListeners();
    await _loadFeed();
    busy = false;
    notifyListeners();
  }

  Future<void> onFeedOrderChanged(FeedOrder selectedValue) async {
    if (_feedOrder != selectedValue) {
      _feedOrder = selectedValue;
      _pageId = 0;
      indices.clear();
      indices.add(0);
      busy = true;
      notifyListeners();
      await _loadFeed();
      busy = false;
      notifyListeners();
    }
  }

  Future<void> onNextPagePressed() async {
    _pageId = _pageId + 1;
    busy = true;
    notifyListeners();
    await _loadFeed();
    busy = false;
    notifyListeners();
  }

  Future<void> onPreviousPagePressed() async {
    if (_pageId > 0) {
      _pageId = _pageId - 1;
      busy = true;
      notifyListeners();
      await _loadFeed();
      busy = false;
      notifyListeners();
    }
  }

  FutureOr<void> _loadFeed() async {
    try {
      if (indices.length == _pageId) {
        indices.add(feed.last.id);
      }
      final request = FeedRequestParams(
        order: _feedOrder,
        pageId: indices[_pageId],
        pageSize: Constants.pageSize,
      );
      final response = await feedUsecase.execute(request);
      feed.clear();
      feed.addAll(response.feed);
    } on Exception catch (ex) {
      debugPrint(ex.toString());
    }
  }
}
