import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../data/services/auth/api.dart';

part 'main_video_player_state.dart';

class MainVideoPlayerCubit extends Cubit<MainVideoPlayerState> {
  MainVideoPlayerCubit() : super(MainVideoPlayerInitial());

  loadNext() async {
    XFile? file = await API().getVideo(1);

    if (file != null) {
      emit(MainVideoPlayerLoaded(file: file));
    }
  }
}
