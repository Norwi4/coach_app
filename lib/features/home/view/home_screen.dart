import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_auth/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
      routes: const [
        TrainRoute(),
        RentalRoute(),
        SearchRoute(),
        UserRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: theme.primaryColor,
              unselectedItemColor: theme.hintColor,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => _openPage(index, tabsRouter),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.date_range), label: "Тренировки"), // shopping_cart
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: "Прокат"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.format_list_bulleted), label: "Список"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Пользователь"),
              ],
            ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
