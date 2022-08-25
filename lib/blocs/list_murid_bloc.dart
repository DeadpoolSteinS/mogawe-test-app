import 'package:bloc/bloc.dart';

class ListMuridBloc extends Cubit<List<String>> {
  List<String> init;
  ListMuridBloc({required this.init}) : super(init);

  List<String> data = [];

  void addItem(val) {
    data.add(val);
    List<String> newList = List.from(data);
    emit(newList);
  }

  void filter(key) {
    List<String> newList =
        data.where((element) => element.contains(key)).toList();
    emit(newList);
  }
}
