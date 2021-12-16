import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/combonanst/combonants.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/status.dart';

class SportsScreenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit, AppStatus>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var list = Newscubit.get(context).Sports;
        return articalbuilder(list);
      },
    );
  }
}
