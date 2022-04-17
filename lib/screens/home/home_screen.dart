import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/controller/menu_controller.dart';
import 'package:flutter_responsive_dashboard/responsive.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_responsive_dashboard/screens/home/component/side_menu.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // flex: 1, (By default flex = 1)
                // It takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
