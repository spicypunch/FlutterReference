import 'package:flutter/material.dart';

import '../model/stat_model.dart';
import '../model/status_model.dart';
import '../utils/data_utils.dart';

class MainAppBar extends StatelessWidget {
  final StatusModel status;
  final StatModel stat;
  final String region;
  final DateTime dateTime;
  final bool isExpanded;

  const MainAppBar({
    required this.status,
    required this.stat,
    required this.region,
    required this.dateTime,
    required this.isExpanded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(color: Colors.white, fontSize: 30.0);

    return SliverAppBar(
      backgroundColor: status.primaryColor,
      pinned: true,
      title: isExpanded
          ? null
          : Text(
              '$region ${DataUtils.getTimeFromDateTime(dateTime: dateTime)}'),
      centerTitle: true,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                Text(
                  region,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  DataUtils.getTimeFromDateTime(dateTime: stat.dataTime),
                  style: ts.copyWith(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  status.imagePath,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  status.label,
                  style:
                      ts.copyWith(fontSize: 40.0, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  status.comment,
                  style:
                      ts.copyWith(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
