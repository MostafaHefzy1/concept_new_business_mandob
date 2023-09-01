import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'data/repository/repository.dart';
import 'data/web_services/web_services.dart';
import 'logic/logic_cubit.dart';
import 'utils/shared_preferences.dart';
import 'utils/themes/light_theme.dart';
import 'views/screens/intro_screen.dart';
import 'views/shared_widgets/bloc_observer.dart';
import 'views/shared_widgets/custom_offline.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CashHelper.init();
  // await WebServices().representativeOrder();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LogicCubit>(
            create: (BuildContext context) =>
                LogicCubit(Repository(WebServices())),
          ),
        ],
        child: ScreenUtilInit(
          builder: (_, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                ),
                child: child!,
              );
            },
            theme: lightTheme,
            home: OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
              ) {
                final bool connected = connectivity != ConnectivityResult.none;
                if (connected) {
                  return const IntroScreen();
                } else {
                  return const CustomOffline();
                }
              },
              child: const SizedBox(),
            ),
          ),
        ));
  }
}
