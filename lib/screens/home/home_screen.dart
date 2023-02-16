import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/assets/app_fonts.dart';
import '../../common/assets/app_icons.dart';
import '../../common/extensions/extensions.dart';
import '../../common/widgets/floating_bottom_navigation.dart';
import '../../common/widgets/floating_bottom_navigation_item.dart';
import '../../l10n/l10n.dart';
import '../dashboard/dashboard_screen.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  List<FloatingBottomNavigationItemModel> get floatingBottomNavItems => [
        FloatingBottomNavigationItemModel(
          label: 'Dashboard',
          iconPath: AppIcons.iconDashboard,
        ),
        FloatingBottomNavigationItemModel(
          label: 'Rooms',
          iconPath: AppIcons.iconRoom,
        ),
        FloatingBottomNavigationItemModel(
          label: 'Profile',
          iconPath: AppIcons.iconProfile,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Text(
            context.l10n.text_my_home,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.inter,
            ),
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SvgPicture.asset(
              AppIcons.iconAdd,
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(context.read()),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => _buildHome(context, state),
          ),
        ),
      ),
      bottomNavigationBar: FloatingBottomNavigation(
        itemCount: floatingBottomNavItems.length,
        itemBuilder: (context, index, currentIndex) {
          return FloatingBottomNavigationItem(
            item: floatingBottomNavItems[index],
            isActive: index == currentIndex,
          );
        },
        onItemClicked: (index) {
          context.read<HomeCubit>().changeBottomNavigationIndex(index);
        },
        currentIndex: context.watch<HomeCubit>().state,
      ),
    );
  }

  Widget _buildHome(BuildContext context, HomeState state) {
    return IndexedStack(
      index: context.read<HomeCubit>().state,
      children: const [
        DashboardScreen(),
        Center(
          child: Text('room'),
        ),
        Center(
          child: Text('profile'),
        ),
      ],
    );
  }
}
