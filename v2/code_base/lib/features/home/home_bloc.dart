import 'package:code_base/core/base/base_bloc.dart';
import 'package:code_base/core/base/base_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:code_base/data/models/post_model.dart';
import 'package:code_base/data/repositories/post_repositories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final PostRepository _postRepository;

  HomeBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(HomeInitial()) {
    on<InitHomeEvent>(_mapInitState);
  }

  Future<void> _mapInitState(
    InitHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoading());
      final posts = await _postRepository.getPosts();
      emit(HomeLoaded(posts: posts));
    } catch (error) {
      emit(HomeError(message: error.toString()));
    }
  }
}
