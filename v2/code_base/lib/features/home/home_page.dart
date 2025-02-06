// * Author: phamchinang
// * Date: 06/02/2025
// * ====================

import 'package:code_base/core/base/base_page.dart';
import 'package:code_base/features/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:code_base/data/service_locator.dart'; // Đảm bảo đã import getIt từ service_locator.dart
import 'package:code_base/data/repositories/post_repositories.dart';

class HomePage extends BasePage<HomeBloc> {
  const HomePage({super.key});

  @override
  HomeBloc createBloc() =>
      HomeBloc(postRepository: getIt<PostRepository>())..add(InitHomeEvent());

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage, HomeBloc> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          }
          return const Center(child: Text('No Data'));
        },
      ),
    );
  }
}
