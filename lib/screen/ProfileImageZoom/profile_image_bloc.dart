
import 'dart:async';

import 'package:apnishaadi/screen/ProfileImageZoom/profile_image_event.dart';
import 'package:apnishaadi/screen/splash/splash_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProfileImageBloc extends Bloc<ProfileImageEvent, int> {


  ProfileImageBloc() : super(1) {
    on<ProfileImageIncressAndDcressEvent>((event, emit) => emit(event.currentNo));
  }

  @override
  Future<void> close() {
    return super.close();
  }


}