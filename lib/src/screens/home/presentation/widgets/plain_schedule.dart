import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';
import 'package:flutter_oat_mobile/src/common/extensions/widget_modifier.dart';
import 'package:flutter_oat_mobile/src/screens/home/presentation/widgets/lesson_schedule_cell.dart';

class LessonSchedule extends StatelessWidget {
  const LessonSchedule({
    super.key,
    required this.callSchedule,
  });

  final List<Map<String, String>> callSchedule;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.localizations.schedule,
                style: context.theme.textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: 32),
          ...List.generate(callSchedule.length, (index) {
            return Column(
              children: [
                LessonScheduleCell(
                  leading: callSchedule[index]['day_number']!,
                  trailing: callSchedule[index]['time']!,
                ),
                if (index != callSchedule.length - 1)
                  const Divider().padding(
                    const EdgeInsets.symmetric(vertical: 12),
                  ),
              ],
            );
          }),
        ],
      ).padding(),
    );
  }
}
