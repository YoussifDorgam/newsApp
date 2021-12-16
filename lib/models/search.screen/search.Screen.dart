import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/combonanst/combonants.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/status.dart';

class SearchScreen extends StatelessWidget {
  var SeachControlar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit , AppStatus>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state)
      {
        var list = Newscubit.get(context).search ;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: 
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color:Colors.grey,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: defulteditTextx(
                    Controlar: SeachControlar,
                    keyboardType: TextInputType.text,
                    Lable: 'Search',
                    InputDecorationn: InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0,),
                        borderSide: BorderSide(
                            color: Colors.white ,

                        ),
                      ),
                      prefixIcon: Icon(
                         Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    onchanged: (value)
                      {
                        Newscubit.get(context).getsearch(value);
                      }
                  ),
                ),
              ),
              Expanded(child: articalbuilder(list , isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}


