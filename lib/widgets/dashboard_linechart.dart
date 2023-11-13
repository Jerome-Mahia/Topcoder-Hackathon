import 'package:flutter/material.dart';
import 'package:topcoder_hackathon/widgets/line_chart_widget.dart';

// Custom widget for displaying a line chart on the dashboard.
class DashboardLinechart extends StatelessWidget {
  const DashboardLinechart({
    super.key,
    required this.isShowingMainData,
  });

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.024,
          bottom: MediaQuery.of(context).size.height * 0.024,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: LineChartWidget(
            isShowingMainData: isShowingMainData),
      ),
    );
  }
}