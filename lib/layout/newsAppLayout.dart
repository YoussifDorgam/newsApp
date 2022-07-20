import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/search.screen/search.Screen.dart';
import '../shared/combonanst/combonants.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/status.dart';






class NewsAppScreen extends StatelessWidget {
  const NewsAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit, AppStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = Newscubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: ()
                {
                  Navegato(context , SearchScreen());
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: ()
                {
                  cubit.onchangeappmode();
                },
                icon: const Icon(
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
