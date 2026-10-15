import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/counter/presentation/manager/counter_provider.dart';
import 'package:notes_app/task/presentation/manager/category_cubit.dart';
import 'package:notes_app/task/presentation/pages/category_page.dart';
import 'package:notes_app/task/presentation/pages/main_page.dart';

import 'package:provider/provider.dart';

import 'core/di/service_locator.dart';
import 'core/theme/app_theme.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translation',
      startLocale: Locale('ar'),
      saveLocale: true,
      fallbackLocale: Locale('ar'),
      useOnlyLangCode: true,
      supportedLocales: [Locale('ar'), Locale('en')],
      child: MultiBlocProvider(
        providers: [
         ChangeNotifierProvider(create: (context) => s1<CounterProvider>(),), BlocProvider(create: (context) => s1<CategoryCubit>()..getAllCategory() ,),

        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 884),
      minTextAdapt: true,
      builder:
          (context, child) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: MainPage(),
      ),
    );
  }
}
