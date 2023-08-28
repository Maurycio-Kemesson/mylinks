import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylinks/app/data/repositories/open_link_repository_impl.dart';
import 'package:mylinks/app/domain/usecases/imp/open_link_usecase_impl.dart';
import 'package:mylinks/app/presentation/home/cubit/link_button_cubit.dart';
import 'package:mylinks/app/presentation/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maurycio Kemesson - Página de links',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider<LinkButtonBloc>(
        create: (_) => LinkButtonBloc(
          OpenLinkUsecaseImpl(OpenLinkRepositoryImpl()),
        ),
        child: const MyHomePage(),
      ),
    );
  }
}
