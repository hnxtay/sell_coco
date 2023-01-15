import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authentication/authentication_cubit.dart';
import '../di/service_locator.dart';
import '../domain/repositories/example_repository.dart';
import '../l10n/l10n.dart';
import '../navigation/navigation.dart';
import '../screens/home/cubit/home_cubit.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ExampleRepository>(
          create: (BuildContext context) =>
              ServiceLocator.instance.inject<ExampleRepository>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationCubit(),
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: AppNavigation.onGeneratedRoute,
      initialRoute: context.read<AuthenticationCubit>().state
          ? AppRoutes.home
          : AppRoutes.login,
    );
  }
}
