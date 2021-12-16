import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/models/search.screen/search.Screen.dart';
import 'package:newsapp/shared/combonanst/combonants.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/status.dart';


class NewsAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit, AppStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = Newscubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: ()
                {
                  Navegato(context , SearchScreen());
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: ()
                {
                  cubit.onchangeappmode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.Bottomitems,
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentstate,
            onTap: (index) {
              cubit.onchangetab(index);
            },
          ),
          body: cubit.Screens[cubit.currentstate],
        );
      },
    );
  }
}
