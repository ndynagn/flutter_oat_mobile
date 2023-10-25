import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';
import 'package:flutter_oat_mobile/src/common/extensions/widget_modifier.dart';
import 'package:flutter_oat_mobile/src/repositories/plain/domain/models/plain_domain.dart';
import 'package:flutter_oat_mobile/src/screens/home/presentation/widgets/plain_schedule_cell.dart';
import 'package:intl/intl.dart';

class PlainSchedule extends StatelessWidget {
  const PlainSchedule({
    super.key,
    required this.plain,
  });

  final List<PlainDayDomain> plain;

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('HH:mm');
    final todayPlain = plain.firstWhere(
      (element) {
        return DateFormat.yMMMMEEEEd().format(element.date.toLocal()) ==
            DateFormat.yMMMMEEEEd().format(DateTime.now().toLocal());
      },
    );
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
          ...List.generate(todayPlain.subjects.length, (index) {
            return Column(
              children: [
                PlainScheduleCell(
                  leading: todayPlain.subjects[index].title,
                  trailing: '${timeFormat.format(
                    todayPlain.subjects[index].time.start.toLocal(),
                  )} — '
                      '${timeFormat.format(
                    todayPlain.subjects[index].time.end.toLocal(),
                  )}',
                ),
                if (index != todayPlain.subjects.length - 1)
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
