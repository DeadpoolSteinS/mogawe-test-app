import 'package:bloc/bloc.dart';

class RadioBloc extends Cubit<int?> {
  int? init;
  RadioBloc({this.init}) : super(null);

  void selected(val) => emit(val);
}
