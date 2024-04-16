import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_video_player_state.dart';

class MainVideoPlayerCubit extends Cubit<MainVideoPlayerState> {
  MainVideoPlayerCubit() : super(MainVideoPlayerInitial());
}
