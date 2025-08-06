import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/balance_view.dart';
import '../balance/balance_cubit.dart';
import 'article.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({super.key, required this.article});

  final Article article;

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  bool rewarded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
        actions: const [BalanceView()],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (!rewarded && notification.metrics.pixels >= notification.metrics.maxScrollExtent) {
            rewarded = true;
            context.read<BalanceCubit>().add(widget.article.reward);
          }
          return false;
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr('lesson.reward', namedArgs: {'reward': widget.article.reward.toStringAsFixed(0)})),
              const SizedBox(height: 16),
              Text(widget.article.content),
              const SizedBox(height: 300), // extra space to allow scroll completion
            ],
          ),
        ),
      ),
    );
  }
}
