import 'package:flutter_bloc/flutter_bloc.dart';

import 'intro_page_state.dart';


class IntroPageCubit extends Cubit<IntroPageState> {
  IntroPageCubit() : super(IntroPageInitial()) {

    emit(IntroPageInitial());

    buttonPressed();
  }

  void buttonPressed() {
    emit(IntroPageButtonPressed());
  }
}
