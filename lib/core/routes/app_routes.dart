import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_poof/screens/main/camera/camera_view.dart';
import 'package:tiny_poof/screens/main/camera/take_picture_view.dart';
import 'package:tiny_poof/screens/main/diary/diary_list_view.dart';
import 'package:tiny_poof/screens/main/home/home_view.dart';
import 'package:tiny_poof/screens/main/main_view.dart';
import 'package:tiny_poof/screens/main/diary/diary_view.dart';
import 'package:tiny_poof/screens/onboarding/view/onboarding_step1.dart';
import 'package:tiny_poof/screens/onboarding/view/onboarding_step2.dart';
import 'package:tiny_poof/screens/onboarding/view/onboarding_step3.dart';
import 'package:tiny_poof/screens/onboarding/view/onboarding_step4.dart';
import 'package:tiny_poof/screens/splash/splash_view.dart';

final routerConfig = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      name: Routes.splash,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const SplashView(),
      ),
    ),
    GoRoute(
      path: Routes.initStep1,
      name: Routes.initStep1,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const OnboardingStep1View(),
      ),
    ),
    GoRoute(
      path: Routes.initStep2,
      name: Routes.initStep2,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const OnboardingStep2View(),
      ),
    ),
    GoRoute(
      path: Routes.initStep3,
      name: Routes.initStep3,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const OnboardingStep3View(),
      ),
    ),
    GoRoute(
      path: Routes.initStep4,
      name: Routes.initStep4,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const OnboardingStep4View(),
      ),
    ),
    GoRoute(
      path: Routes.main,
      name: Routes.main,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const MainView(),
      ),
      routes: [
        GoRoute(
          path: Routes.camera,
          name: Routes.camera,
          pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            child: const CameraView(),
          ),
          routes: [
            GoRoute(
              path: Routes.takePicture,
              name: Routes.takePicture,
              pageBuilder: (context, state) => CupertinoPage(
                key: state.pageKey,
                child: const TakePictureView(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: Routes.home,
          name: Routes.home,
          pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            child: const HomeView(),
          ),
        ),
        GoRoute(
          path: Routes.diary,
          name: Routes.diary,
          pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            child: const DiaryView(),
          ),
          routes: [
            GoRoute(
              path: Routes.diaryList,
              name: Routes.diaryList,
              pageBuilder: (context, state) => CupertinoPage(
                key: state.pageKey,
                child: const DiaryListView(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

abstract class Routes {
  static const splash = '/';
  static const initStep1 = '/init/step1';
  static const initStep2 = '/init/step2';
  static const initStep3 = '/init/step3';
  static const initStep4 = '/init/step4';
  static const main = '/main';
  static const camera = 'camera';
  static const takePicture = 'takePicture';
  static const home = 'home';
  static const diary = 'diary';
  static const diaryList = 'diaryList';
}
