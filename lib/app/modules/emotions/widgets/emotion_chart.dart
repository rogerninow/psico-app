import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:psico_app/app/data/models/emotion.dart';
import 'package:psico_app/app/data/models/emotion_type.dart';
import 'package:psico_app/app/modules/emotions/controller.dart';

class EmotionsChart extends StatelessWidget {

  final shadowColor = const Color(0xFFCCCCCC);
  BarChartGroupData generateBarGroup(
      int x,
      Color color,
      int value
      ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value.toDouble(),
          color: color,
          width: 6,
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    EmotionsController _ = Get.find();

    return Obx(() => _.list.length > 0 ? Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 18),
          AspectRatio(
            aspectRatio: 1.4,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                rotationQuarterTurns: 0,
                borderData: FlBorderData(
                  show: true,
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: Colors.black.withValues(alpha: 0.2),
                    ),
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: const AxisTitles(
                    drawBelowEverything: true,
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 36,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        return SideTitleWidget(
                          meta: meta,
                          child: Icon(
                            _.emotionTypes[index-1].icon,
                            color: _.emotionTypes[index-1].color
                          )
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.black.withValues(alpha: 0.2),
                    strokeWidth: 1,
                  ),
                ),
                barGroups: _.emotionTypes.map((EmotionType emotionType) {
                  return generateBarGroup(
                    emotionType.index,
                    emotionType.color,
                    _.list.where((Emotion emotion) => emotion.name == emotionType.name).length
                  );
                }).toList(),
                maxY: _.list.length.toDouble(),
                barTouchData: BarTouchData(
                  enabled: true,
                  handleBuiltInTouches: false,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => Colors.transparent,
                    tooltipMargin: 0,
                    getTooltipItem: (
                        BarChartGroupData group,
                        int groupIndex,
                        BarChartRodData rod,
                        int rodIndex,
                        ) {
                      return BarTooltipItem(
                        rod.toY.toString(),
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          color: rod.color,
                          fontSize: 18,
                          shadows: const [
                            Shadow(
                              color: Colors.black26,
                              blurRadius: 12,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ) : Container());
  }
}