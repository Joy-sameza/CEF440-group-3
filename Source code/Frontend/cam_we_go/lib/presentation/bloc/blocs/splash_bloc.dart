import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SplashEvent {}

class SplashStarted extends SplashEvent {}

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {}

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>((event, emit) async {
      emit(SplashLoading());
      await Future.delayed(const Duration(seconds: 2)); // Simulate some loading time
      emit(SplashLoaded());
    });
  }
}
