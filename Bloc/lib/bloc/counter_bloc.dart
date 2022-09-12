/*import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc2 extends Bloc<CounterEvent, CounterState> {
  CounterBloc2() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}*/
import "dart:async";

class CounterBase {}

class IncrementCounter extends CounterBase {}

class DecrementCounter extends CounterBase {}

class MultCounter extends CounterBase {}

class PotCounter extends CounterBase {}

class CounterBloc {
  int _count = 0;
  StreamController<CounterBase> _input = StreamController();
  StreamController<int> _output = StreamController();
  Stream<int> get counterStream => _output.stream;
  StreamSink<CounterBase> get sendEvent => _input.sink;

  CounterBloc() {
    _input.stream.listen(_onEvent);
  }

  void dispose() {
    _input.close();
    _output.close();
  }

  void _onEvent(CounterBase event) {
    if (event is IncrementCounter) {
      _count++;
    }
    if (event is MultCounter) {
      _count = (_count * 2);
    }
    if (event is PotCounter) {
      _count = (_count * _count);
    } else if (event is DecrementCounter) {
      _count--;
    }
    _output.add(_count);
    /*if(event is IncrementCounter){
        _output.add(++_counter);
      }else if(event is ClearCounter){
        _counter = 0;
        _output.add(0);
      }*/
  }
}
