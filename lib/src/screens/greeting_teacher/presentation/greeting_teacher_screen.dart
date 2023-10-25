import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_oat_mobile/src/common/constants/shared_prefs_constants.dart';
import 'package:flutter_oat_mobile/src/common/extensions/context_extensions.dart';
import 'package:flutter_oat_mobile/src/common/extensions/widget_modifier.dart';
import 'package:flutter_oat_mobile/src/common/utils/global_snackbar.dart';
import 'package:flutter_oat_mobile/src/common/widgets/primary_button.dart';
import 'package:flutter_oat_mobile/src/common/widgets/primary_circular_progress_indicator.dart';
import 'package:flutter_oat_mobile/src/common/widgets/primary_dropdown_button.dart';
import 'package:flutter_oat_mobile/src/config/routes/routes.dart';
import 'package:flutter_oat_mobile/src/repositories/local_storage/data/local_storage_repository_impl.dart';
import 'package:flutter_oat_mobile/src/repositories/teachers/data/teachers_repository_impl.dart';
import 'package:flutter_oat_mobile/src/repositories/teachers/domain/models/teacher_domain.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'greeting_teacher_screen.g.dart';

@riverpod
Future<List<TeacherDomain>> teachers(TeachersRef ref) async {
  final repository = ref.watch(teachersRepositoryProvider);
  final teachers = await repository.getTeachers();
  return teachers;
}

class GreetingTeacherScreen extends HookConsumerWidget {
  const GreetingTeacherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersData = ref.watch(teachersProvider);
    final teacher = useState<String?>(null);
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    final isLoading = useState<bool>(false);

    Future<void> saveData() async {
      try {
        isLoading.value = true;
        if (teacher.value == null || teacher.value!.isEmpty) {
          return GlobalSnackbar.show(
            context,
            message: context.localizations.pickTeacher,
          );
        }
        final saveUserTypeResult = await localStorageRepository.setString(
          key: SharedPrefsConstants.userType.name,
          value: SharedPrefsConstants.teacher.name,
        );
        final saveGroupResult = await localStorageRepository.setString(
          key: SharedPrefsConstants.teacher.name,
          value: teacher.value!,
        );
        if (saveUserTypeResult && saveGroupResult) {
          return context.go(AppRoutes.rootRoute);
        } else {
          return GlobalSnackbar.show(
            context,
            message: context.localizations.unexpectedErrorMessage,
          );
        }
      } on Exception catch (_) {
        return GlobalSnackbar.show(
          context,
          message: context.localizations.unexpectedErrorMessage,
        );
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      body: teachersData.when(
        data: (data) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: 110,
                collapsedHeight: 110,
                flexibleSpace: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${context.localizations.welcome}!',
                        style: context.theme.textTheme.labelMedium,
                      ),
                      Text(
                        context.localizations.registrationTips,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          color:
                              context.theme.colorScheme.primary.withOpacity(.4),
                        ),
                      ),
                    ],
                  ).padding(),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            context.localizations.pickTeacher,
                            style: context.theme.textTheme.labelSmall,
                          ),
                          const SizedBox(height: 24),
                          PrimaryDropdownButton<String>(
                            items: List.generate(
                              data.length,
                              (index) => DropdownMenuItem<String>(
                                value: data[index].name,
                                child: Text(data[index].name),
                              ),
                            ),
                            onChanged: (value) {
                              if (value == null || value.isEmpty) {
                                return;
                              }
                              teacher.value = value;
                            },
                            value: teacher.value,
                            hint: context.localizations.teacher,
                          ),
                          const SizedBox(height: 18),
                          PrimaryButton(
                            onPressed: isLoading.value ? null : saveData,
                            child: isLoading.value
                                ? SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: PrimaryCircularProgressIndicator(
                                      color:
                                          context.theme.colorScheme.secondary,
                                    ),
                                  )
                                : Text(context.localizations.continue_),
                          ),
                        ],
                      ).padding(),
                    ),
                    const SizedBox(height: 18),
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(context.localizations.studentUserType),
                    ).padding(const EdgeInsets.symmetric(horizontal: 24)),
                  ],
                ),
              ).sliverPadding(const EdgeInsets.only(top: 18)),
            ],
          );
        },
        error: (error, stackTrace) {
          return SafeArea(
            child: Center(
              child: Text(
                '$error',
                style: context.theme.textTheme.bodyMedium,
              ),
            ),
          );
        }, //!TODO: Add widget
        loading: () {
          return const SafeArea(
            child: Center(
              child: PrimaryCircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
