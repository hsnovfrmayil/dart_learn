import 'dart:async';

  void main() {
    final streamController = StreamController(
      onPause: () => print('Paused'),
      onResume: () => print('Resumed'),
      onCancel: () => print('Cancelled'),
      onListen: () => print('Listens'),
    );
    streamController.stream.listen(
      (event) => print('Event: $event'),
      onDone: () => print('Done'),
      onError: (error) => print(error),
    );
  }
