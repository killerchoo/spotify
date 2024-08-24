import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:spotify/common/helper/is_darkmode.dart';

final drawController = AdvancedDrawerController();

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool hideback;

  const BasicAppBar({
    this.title,
    this.hideback = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: title ?? const Text(""),
      centerTitle: true,
      leading: hideback
          ? MenuIcon()
          : IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Colors.white.withOpacity(0.03)
                : Colors.black.withOpacity(0.04),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Widget MenuIcon() {
  return IconButton(
    onPressed: _handleMenuButton,
    icon: ValueListenableBuilder(
      valueListenable: drawController,
      builder: (_, value, __) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: Icon(
            value.visible ? Icons.clear : Icons.menu,
            key: ValueKey<bool>(value.visible),
          ),
        );
      },
    ),
  );
}

void _handleMenuButton() {
  drawController.showDrawer();
}
