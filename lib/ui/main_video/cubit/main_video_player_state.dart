part of 'main_video_player_cubit.dart';

@immutable
sealed class MainVideoPlayerState {}

final class MainVideoPlayerInitial extends MainVideoPlayerState {}

final class MainVideoPlayerLoaded extends MainVideoPlayerState {
  final XFile file;

  MainVideoPlayerLoaded({required this.file});
}
