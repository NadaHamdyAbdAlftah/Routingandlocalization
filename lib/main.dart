import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:session_2/cubit/them_cubit.dart';
import 'package:session_2/utils/color_schemes.dart';
import 'package:session_2/utils/typography.dart';
import 'package:sizer/sizer.dart';

import 'package:session_2/utils/routing.dart';

 Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage =
  await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),);

  runApp(MyApp(appRouter :AppRouter() ));

}
class MyApp extends StatelessWidget{
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter ;
  @override
  Widget build(BuildContext context) {
        return BlocProvider<ThemCubit>(create: (_)=>ThemCubit(),
        child: BlocBuilder<ThemCubit , bool>(
          builder: (context,state){
            return Sizer(
                builder: (context, orientation, deviceType) {
             return MaterialApp.router(
              themeMode: state? ThemeMode.dark:ThemeMode.light ,
              theme: ThemeData(
                colorScheme: lightColorScheme,
                textTheme: textTheme,
                useMaterial3: true
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme,
                textTheme: textTheme,
                useMaterial3: true,
              ),

              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              localeResolutionCallback:localeCallBack ,
              routerConfig: appRouter.router ,
            );});
          },
        )


        );

  }
}

Locale localeCallBack(Locale? locale , Iterable<Locale> supportedLocales){
  if(locale == null){
    return supportedLocales.last ;
  }
  for(var supportedLocale in supportedLocales ){
    if(locale.languageCode == supportedLocale.languageCode){
      return supportedLocale;
    }
  }
  return supportedLocales.last;
}