import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friend_is_app/shared/cubit/cubit.dart';
import 'package:friend_is_app/shared/cubit/status.dart';
import 'package:friend_is_app/shared/remote/catch.helper.dart';
import 'package:friend_is_app/shared/remote/dio.helper.dart';

import 'layout/newsAppLayout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Diohelper.init();
  await cachHelper.init();
  bool? isdark = cachHelper.getdata(key: 'Isdark');
  runApp(MyApp(isdark));
}

class MyApp extends StatelessWidget {
  final bool? isdark;

  const MyApp(this.isdark, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Newscubit()
        ..getbusniss()
        ..onchangeappmode(
          formShared: isdark,
        ),
      child: BlocConsumer<Newscubit, AppStatus>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = Newscubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.deepOrange,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.black12,
                appBarTheme: const AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black12,
                  ),
                  backgroundColor: Colors.black12,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.black12,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.deepOrange,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              themeMode: cubit.isappmode ? ThemeMode.dark : ThemeMode.light,
              home: const NewsAppScreen(),
            );
          }),
    );
  }
}
