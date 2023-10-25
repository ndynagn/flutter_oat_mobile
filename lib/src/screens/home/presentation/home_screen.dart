import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';
import 'package:flutter_oat_mobile/src/common/extensions/widget_modifier.dart';
import 'package:flutter_oat_mobile/src/common/utils/string_extensions.dart';
import 'package:flutter_oat_mobile/src/common/widgets/primary_circular_progress_indicator.dart';
import 'package:flutter_oat_mobile/src/config/routes/routes.dart';
import 'package:flutter_oat_mobile/src/config/styles/dimensions.dart';
import 'package:flutter_oat_mobile/src/repositories/plain/data/plain_repository_impl.dart';
import 'package:flutter_oat_mobile/src/repositories/plain/domain/models/plain_domain.dart';
import 'package:flutter_oat_mobile/src/screens/home/presentation/widgets/pager_bar.dart';
import 'package:flutter_oat_mobile/src/screens/home/presentation/widgets/plain_schedule.dart';
import 'package:flutter_oat_mobile/src/screens/home/presentation/widgets/settings_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen.g.dart';

@riverpod
Future<List<PlainDayDomain>> plain(
  PlainRef ref, {
  required String week,
}) async {
  final repository = ref.watch(plainRepositoryProvider);
  final plain = await repository.getPlain(week);
  return plain;
}

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekdayName = DateFormat.EEEE().format(DateTime.now()).capitalize();
    final todayDate = DateFormat('d MMMM').format(DateTime.now());
    final plainData = ref.watch(plainProvider(week: '8'));
    final controller = usePageController();
    final selectedPage = useState<int>(0);
    const subjectsCount = 3;
    final schedulePageNames = [
      context.localizations.today,
      context.localizations.tomorrow,
      '1 ${context.localizations.week}'.toLowerCase(),
      '2 ${context.localizations.week}'.toLowerCase(),
    ];
    return plainData.when(
      data: (data) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              expandedHeight: 100,
              collapsedHeight: 100,
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: AppDimensions.mediumLarge,
                  cornerSmoothing: 1,
                ),
              ),
              flexibleSpace: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weekdayName,
                      style: context.theme.textTheme.labelMedium,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      todayDate.toLowerCase(),
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        color:
                            context.theme.colorScheme.primary.withOpacity(.4),
                      ),
                    ),
                    const Spacer(),
                    SettingsButton(
                      onPressed: () => context.push(AppRoutes.settingsRoute),
                    ),
                  ],
                ).padding(const EdgeInsets.fromLTRB(24, 32, 24, 24)),
              ),
            ),
            SliverToBoxAdapter(
              child: PagerBar(
                selectedPage: selectedPage.value,
                pages: schedulePageNames,
                onTap: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                ),
              ),
            ).sliverPadding(const EdgeInsets.symmetric(vertical: 16)),
            SliverToBoxAdapter(
              child: Card(
                child: ExpandablePageView.builder(
                  controller: controller,
                  itemCount: 4,
                  onPageChanged: (page) => selectedPage.value = page,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '$subjectsCount ',
                            children: [
                              TextSpan(
                                text: subjectsCount == 0
                                    ? context.localizations.lessons
                                        .toLowerCase()
                                    : subjectsCount == 1
                                        ? context.localizations.lesson
                                            .toLowerCase()
                                        : subjectsCount <= 4
                                            ? context
                                                .localizations.middleLessons
                                                .toLowerCase()
                                            : context.localizations.lessons
                                                .toLowerCase(),
                                style: context.theme.textTheme.labelMedium
                                    ?.copyWith(
                                  color: context.theme.colorScheme.primary
                                      .withOpacity(.3),
                                ),
                              ),
                            ],
                            style: context.theme.textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ).padding();
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: PlainSchedule(plain: data),
            ).sliverPadding(const EdgeInsets.symmetric(vertical: 16)),
          ],
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text('$error'),
        );
      },
      loading: () {
        return const Center(
          child: PrimaryCircularProgressIndicator(),
        );
      },
    );
  }
}
