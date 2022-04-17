import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/models/recentFiles_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recent Files", style: Theme.of(context).textTheme.subtitle1),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(label: Text("File Name")),
                DataColumn(label: Text("Date")),
                DataColumn(label: Text("Size")),
              ],
              rows: List.generate(
                recentFilesList.length,
                (index) => recentFileDataRow(recentFilesList[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// TODO RecentFileDataRow
DataRow recentFileDataRow(RecentFile recentFile) {
  return DataRow(
    cells: [
      // File Name
      DataCell(
        Row(
          children: [
            SvgPicture.asset(recentFile.icon!, height: 30, width: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(recentFile.title!),
            ),
          ],
        ),
      ),
      // Date
      DataCell(Text(recentFile.date!)),
      // Size
      DataCell(Text(recentFile.size!)),
    ],
  );
}
