import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/models/busniss/busniss.dart';
import 'package:newsapp/models/science/science.dart';
import 'package:newsapp/models/sports/sportsscreen.dart';
import 'package:newsapp/shared/cubit/status.dart';
import 'package:newsapp/shared/remote/catch.helper.dart';
import 'package:newsapp/shared/remote/dio.helper.dart';

class Newscubit extends Cubit<AppStatus> {
  Newscubit() : super(AppInitialState());

  static Newscubit get(context) => BlocProvider.of(context);

  int currentstate = 0;

  List<BottomNavigationBarItem> Bottomitems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business_outlined,
        ),
        label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'science'),
  ];

  void onchangetab(int index) {
    currentstate = index;
    emit(OnchangeNavbar());
  //  if(index == 0) getbusniss() ;
    if(index == 1) getSports() ;
    if(index == 2) getScience() ;
  }

  List<Widget> Screens = [
    BusinessScreenn(),
    SportsScreenn(),
    ScienceScreenn(),
  ];

  List<dynamic> busniss = [];

  void getbusniss() {
    if(busniss.length == 0)
      {
        emit(AppBusinissLodingState());
        Diohelper.getdata(url: 'v2/top-headlines', query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '975d7b6f1c9e47dcac206301a11ec09e',
        }).then((value) {
          //print(value.data.toString());
          busniss = value.data['articles'];
          print(busniss[0]['title']);
          emit(AppBusinissSuccessState());
        }).catchError((error) {
          print('error is ${error.toString()}');
          emit(AppBusinissErrorState(error.toString()));
        });
      }else
        {
          emit(AppBusinissSuccessState());
        }

  }


  List<dynamic> Sports = [];

  void getSports() {

    if(Sports.length == 0 )
      {
        emit(AppSprotsLodingState());
        Diohelper.getdata(url: 'v2/top-headlines', query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '975d7b6f1c9e47dcac206301a11ec09e',
        }).then((value) {
          //print(value.data.toString());
          Sports = value.data['articles'];
          print(Sports[0]['title']);
          emit(AppSprotsSuccessState());
        }).catchError((error) {
          print('error is ${error.toString()}');
          emit(AppSprotsErrorState(error.toString()));
        });
      }else
        {
          emit(AppSprotsSuccessState());
        }

  }



  List<dynamic> Science = [];

  void getScience() {
    if(Science.length == 0 )
      {
        emit(AppScienceLodingState());
        Diohelper.getdata(url: 'v2/top-headlines', query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '975d7b6f1c9e47dcac206301a11ec09e',
        }).then((value) {
          //print(value.data.toString());
          Science = value.data['articles'];
          print(Science[0]['title']);
          emit(AppScienceSuccessState());
        }).catchError((error) {
          print('error is ${error.toString()}');
          emit(AppScienceErrorState(error.toString()));
        });
      }else
        {
          emit(AppScienceSuccessState());
        }

  }

  List<dynamic> search = [];
  void getsearch(String value) {
      emit(AppSearchLodingState());
      Diohelper.getdata(url: 'v2/everything', query: {
        'q': '$value',
        'apiKey': '975d7b6f1c9e47dcac206301a11ec09e',
      }).then((value) {
        //print(value.data.toString());
        search = value.data['articles'];
        print(search[0]['title']);
        emit(AppSearchSuccessState());
      }).catchError((error) {
        print('error is ${error.toString()}');
        emit(AppSearchErrorState(error.toString()));
      });


  }



  bool isappmode = false ;
  void onchangeappmode({bool? formShared})
  {
    if(formShared != null)
      {
        isappmode = formShared ;
        emit(onchangeappmodee());
      }else
        {
          isappmode = !isappmode ;
          cachHelper.putdata(key: 'Isdark', value: isappmode).then((value)
          {
            emit(onchangeappmodee());
          });
        }



  }


}
