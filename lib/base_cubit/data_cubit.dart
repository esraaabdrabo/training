import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<DataStates> {
  DataCubit(super.initialState);
  Future<void> fetch() async {
    await Future.delayed(const Duration(seconds: 5));

    emit(DataShowLoading());
    log("here");
    await Future.delayed(const Duration(seconds: 5));
    emit(DataHideLoading());

    await Future.delayed(const Duration(seconds: 5));
    emit(DataUnAuthorizedState());
  }
}

//base
abstract class BaseShowLoadingState {}

abstract class BaseHideLoadingState {}

abstract class BaseUnAuthorizedState {}

abstract class DataStates {}

class DataInit extends DataStates {}

class DataShowLoading extends DataStates implements BaseShowLoadingState {}

class DataHideLoading extends DataStates implements BaseHideLoadingState {}

class DataUnAuthorizedState extends DataStates
    implements BaseUnAuthorizedState {}
