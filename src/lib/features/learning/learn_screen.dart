import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../shared/balance_view.dart';
import '../balance/balance_cubit.dart';
import 'article.dart';
import 'articles_repository.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  late Future<List<Article>> _future;
  final _repo = ArticlesRepository();

  @override
  void initState() {
    super.initState();
    _future = _repo.loadArticles();
  }

  Future<void> _refresh() async {
    setState(() {
      _future = _repo.loadArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onLongPress: () => context.read<BalanceCubit>().reset(),
          child: Text(tr('learn.title')),
        ),
        actions: const [BalanceView()],
      ),
      body: FutureBuilder<List<Article>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final articles = snapshot.data ?? [];
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  title: Text('${index + 1}. ${article.title}'),
                  subtitle: Text(tr('lesson.reward', namedArgs: {'reward': article.reward.toStringAsFixed(0)})),
                  onTap: () => context.go('/learn/${article.id}', extra: article),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
