import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiny_poof/core/base/base_viewmodel.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  final T viewModel;
  final bool isResetState;

  const BaseView({
    super.key,
    required this.viewModel,
    required this.builder,
    this.isResetState = true,
  });

  @override
  BaseViewState<T> createState() => BaseViewState<T>();
}

class BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;
    if (widget.isResetState) {
      viewModel.setContext(context);
    }

    viewModel.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: viewModel,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
