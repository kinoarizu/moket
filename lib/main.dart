import 'package:flutix/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc.dart';
import 'ui/pages/pages.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  /// ----------------------------
  /// Root of this application
  /// ----------------------------
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      //* Listening userState from auth service
      value: AuthServices.userStream,

      //* Listing blocs module of this application
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => ThemeBloc()),
          BlocProvider(create: (_) => MovieBloc()..add(FetchMovies())),
          BlocProvider(create: (_) => TicketBloc()),
        ],

        //* Handle building bloc state of theme application
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) => MaterialApp(

            //* Calling theme data from theme state
            theme: themeState.themeData,
            debugShowCheckedModeBanner: false,

            //* Calling root widget of this application
            home: Wrapper(),
          ),
        ),
      ),
    );
  }
}
