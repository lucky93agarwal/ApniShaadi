import 'dart:async';

import 'package:apnishaadi/screen/splash/splash_event.dart';
import 'package:apnishaadi/screen/splash/splash_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {


  SplashBloc() : super(SplashFalseState()) {
    on<CheckTimingEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3), () {
        print("change 756");
        emit(SplashTrueState());
      });
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  void onChange(Change<SplashState> change) {
    //
    super.onChange(change);
    if (kDebugMode) {
      print("change 786 = " + change.currentState.toString());
    }
  }
}
