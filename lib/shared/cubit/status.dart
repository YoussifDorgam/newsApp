abstract class AppStatus {}

class AppInitialState extends AppStatus {}

class OnchangeNavbar extends AppStatus {}

class AppBusinissSuccessState extends AppStatus {}

class AppBusinissErrorState extends AppStatus {
  final String error;

  AppBusinissErrorState(this.error);
}

class AppBusinissLodingState extends AppStatus {}

class AppSprotsSuccessState extends AppStatus {}

class AppSprotsErrorState extends AppStatus {
  final String error;

  AppSprotsErrorState(this.error);
}

class AppSprotsLodingState extends AppStatus {}

class AppScienceSuccessState extends AppStatus {}

class AppScienceErrorState extends AppStatus {
  final String error;

  AppScienceErrorState(this.error);
}

class AppScienceLodingState extends AppStatus {}

class onchangeappmodee extends AppStatus {}

class AppSearchSuccessState extends AppStatus {}

class AppSearchErrorState extends AppStatus {
  final String error;

  AppSearchErrorState(this.error);
}

class AppSearchLodingState extends AppStatus {}
