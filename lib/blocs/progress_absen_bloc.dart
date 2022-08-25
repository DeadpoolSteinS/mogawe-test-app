import 'package:bloc/bloc.dart';

class ProgressAbsenBloc extends Cubit<int> {
  int init;
  ProgressAbsenBloc({this.init = 0}) : super(init);

  void increase() => emit(state + 1);
}
