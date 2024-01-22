import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_view.dart';
import 'package:tiny_poof/screens/main/main_view_model.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: MainViewModel.instance,
      builder: (context, viewModel, child) => Scaffold(
        body: viewModel.currentView,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.changeView,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt, size: 36),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 36),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 36),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
