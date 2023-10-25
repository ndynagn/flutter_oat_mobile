import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/assets/assets.dart';
import 'package:flutter_oat_mobile/src/common/extensions/string_extensions.dart';
import 'package:flutter_oat_mobile/src/common/extensions/widget_modifier.dart';
import 'package:flutter_oat_mobile/src/common/widgets/primary_back_button.dart';
import 'package:flutter_oat_mobile/src/screens/settings/presentation/widgets/settings_cell.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          floating: true,
          expandedHeight: 100,
          collapsedHeight: 100,
          flexibleSpace: SafeArea(
            child: Row(
              children: [
                PrimaryBackButton(onPressed: context.pop //!TODO
                        )
                    .padding(
                  const EdgeInsets.fromLTRB(24, 32, 24, 24),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Card(
            child: Column(
              children: [
                SettingsCell(
                  icon: Assets.messagesIcon,
                  title: 'Сообщить о проблеме'.hardcoded,
                ),
                const SizedBox(height: 24),
                SettingsCell(
                  icon: Assets.doorArrowIcon,
                  title: 'Выйти из аккаунта'.hardcoded,
                ),
              ],
            ).padding(
              const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
          ),
        ).sliverPadding(const EdgeInsets.only(top: 16)),
      ],
    );
  }
}
