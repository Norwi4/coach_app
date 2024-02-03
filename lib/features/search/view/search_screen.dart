import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          title: const Text("Sklon"),
          backgroundColor: theme.cardColor,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: SearchButton(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList.builder(itemBuilder: (context, index) => const ListCard())
      ],
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
        padding: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
            color: theme.cardColor, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                "Тренер",
                style: theme.textTheme.bodyLarge
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              color: theme.hintColor.withOpacity(0.2),
            )
          ],
        )
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: theme.hintColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            const Icon(Icons.search_rounded),
            const SizedBox(width: 12),
            Text(
              'Поиск',
              style: TextStyle(
                  fontSize: 18,
                  color: theme.hintColor.withOpacity(0.4),
                  fontWeight: FontWeight.w700),
            ),
          ],
        ));
  }
}