import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/combonanst/combonants.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/status.dart';


class BusinesScreen extends StatelessWidget {
  const BusinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit , AppStatus>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state)
      {
        var list = Newscubit.get(context).busniss ;
        return articalbuilder(list);
      },

    );
  }
}
