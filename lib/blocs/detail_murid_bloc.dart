import 'package:bloc/bloc.dart';

class DetailMuridBloc extends Cubit<int> {
  int init;
  DetailMuridBloc({this.init = 0}) : super(init);

  void increase() => emit(state + 1);
}
