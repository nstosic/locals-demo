import 'package:flutter/material.dart';
import 'package:locals_demo/model/feed_request_params.dart';
import 'package:locals_demo/ui/base/base_view.dart';
import 'package:locals_demo/ui/screens/home_viewmodel.dart';
import 'package:locals_demo/ui/widgets/locals_list_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          const Text(
                            'Sort by: ',
                            style: TextStyle(
                              color: Color(0xff999999),
                            ),
                          ),
                          PopupMenuButton<FeedOrder>(
                            initialValue: viewModel.feedOrder,
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem<FeedOrder>(
                                  value: FeedOrder.oldest,
                                  child: Text('Oldest'),
                                ),
                                const PopupMenuItem<FeedOrder>(
                                  value: FeedOrder.recent,
                                  child: Text('Recent'),
                                ),
                              ];
                            },
                            onSelected: viewModel.onFeedOrderChanged,
                            child: Text(viewModel.feedOrder == FeedOrder.recent ? 'Recent' : 'Oldest'),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => _buildListItem(
                            context,
                            index,
                            viewModel,
                          ),
                          itemCount: viewModel.feed.length,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: viewModel.onPreviousPagePressed,
                              child: const Text(
                                'Previous page',
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: viewModel.onNextPagePressed,
                              child: const Text(
                                'Next page',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (viewModel.busy)
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
      viewModel: HomeViewModel(),
    );
  }

  Widget _buildListItem(BuildContext context, int index, HomeViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          color: Color(0xff999999),
          height: 1,
          thickness: 1,
        ),
        LocalsListItem(feedItem: viewModel.feed[index]),
      ],
    );
  }
}
