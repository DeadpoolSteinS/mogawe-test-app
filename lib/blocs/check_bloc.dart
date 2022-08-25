import 'package:bloc/bloc.dart';

class CheckBloc extends Cubit<bool> {
  bool init;
  CheckBloc({this.init = false}) : super(init);

  void change() => emit(true);
}
