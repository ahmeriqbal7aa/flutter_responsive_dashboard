import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/responsive.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/header.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/my_files.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/recent_files.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/storage_details.dart';

import '../../constants.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            // TODO Header
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      // TODO MyFiles
                      MyFiles(),
                      SizedBox(height: defaultPadding),
                      // TODO RecentFiles
                      RecentFiles(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      // TODO StorageDetails
                      if (Responsive.isMobile(context)) StorageDetails(),
                    ],
                  ),
                ),

                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850
                // we don't want to show it
                if (!Responsive.isMobile(context))
                  // TODO StorageDetails
                  Expanded(flex: 2, child: StorageDetails()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
