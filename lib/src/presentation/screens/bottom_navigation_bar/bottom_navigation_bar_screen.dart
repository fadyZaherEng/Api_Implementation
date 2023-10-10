import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/presentation/screens/payslip/payslip_screen.dart';
import 'package:talent_link/src/presentation/screens/request_screen/request_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Center(child: Text(S.current.home)),
    Center(child: Text(S.current.profile)),
    const RequestScreen(),
    const PayslipScreen(),
    Center(child: Text(S.current.more)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorSchemes.gray,
              blurRadius: 20,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: WillPopScope(
          onWillPop: () {
            _onWillPop();
            return Future.value(true);
          },
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.homeUnSelected),
                ),
                label: S.of(context).home,
                activeIcon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.homeSelected),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.profileUnSelected),
                ),
                label: S.of(context).profile,
                activeIcon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.profileSelected),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.requestUnSelected),
                ),
                label: S.of(context).request,
                activeIcon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.requestSelected),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.payslipUnSelected),
                ),
                label: S.of(context).payslip,
                activeIcon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.payslipSelected),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.moreUnSelected),
                ),
                label: S.of(context).more,
                activeIcon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.moreSelected),
                ),
              )
            ],
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: ColorSchemes.redError,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            unselectedItemColor: ColorSchemes.gray,
            backgroundColor: ColorSchemes.white,
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: ColorSchemes.redError),
            selectedLabelStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: ColorSchemes.primary),
            onTap: (index) => setState(() => _onItemTapped(index)),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWillPop() {}
}
