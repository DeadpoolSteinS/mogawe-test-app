import 'package:bloc/bloc.dart';

class AbsenDetailBloc extends Cubit<String?> {
  String? init;
  AbsenDetailBloc({this.init}) : super(null);

  void change(val) => emit(val);
}
