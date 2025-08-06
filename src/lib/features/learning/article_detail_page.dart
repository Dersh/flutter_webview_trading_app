import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse(widget.article.url));
  }

  Future<bool> _handlePop() async {
    if (!rewarded) {
      rewarded = true;
      context.read<BalanceCubit>().add(widget.article.reward);
    }
    return true;
  }

  @override
  void dispose() {
    if (!rewarded) {
      context.read<BalanceCubit>().add(widget.article.reward);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handlePop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.article.title),
          actions: const [BalanceView()],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(tr('lesson.reward',
                  namedArgs: {'reward': widget.article.reward.toStringAsFixed(0)})),
            ),
            Expanded(child: WebViewWidget(controller: _controller)),
          ],
        ),
      ),
    );
  }
}
