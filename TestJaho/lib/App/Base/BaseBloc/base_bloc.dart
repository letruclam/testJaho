
import 'dart:async';

class BaseBloc  {

  final eventLoading = StreamController<bool>.broadcast();

  Stream<bool> get loading => eventLoading.stream;
  void setLoading(bool value) => eventLoading.sink.add(value);

}