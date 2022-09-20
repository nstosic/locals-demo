import 'package:flutter/material.dart';
import 'package:locals_demo/ui/base/base_navigation.dart';
import 'package:locals_demo/ui/base/base_viewmodel.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({
    required this.builder,
    required this.viewModel,
    this.child,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext, T, Widget?) builder;
  final Widget? child;
  final T viewModel;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.init();
    widget.viewModel.navigateTo = (page, clearStack) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) {
            return generateScreenWidget(page);
          },
        ),
        (route) => !clearStack,
      );
    };
    widget.viewModel.addListener(_viewStateListener);
  }

  void _viewStateListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      widget.viewModel,
      widget.child,
    );
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_viewStateListener);
    widget.viewModel.dispose();
    super.dispose();
  }
}
