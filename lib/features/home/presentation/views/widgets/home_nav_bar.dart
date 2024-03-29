import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/cart/presentation/views/cart_view.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

PersistentTabController controller = PersistentTabController(initialIndex: 0);

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const SearchView(),
    const CartView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesHomeIconActive),
        inactiveIcon: SvgPicture.asset(Assets.imagesHomeIcon)),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesSearchActive),
        inactiveIcon: SvgPicture.asset(Assets.imagesSearch)),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesShoppingCartActive),
        inactiveIcon: SvgPicture.asset(Assets.imagesShoppingCart)),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesPersonActive),
        inactiveIcon: SvgPicture.asset(Assets.imagesPerson)),
  ];
}
