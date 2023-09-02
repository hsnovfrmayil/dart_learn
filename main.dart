import 'package:meta/meta.dart';

void main() {
  // counts().listen((event) {
  //   print(event);
  // });
  streamMethod();
}

Stream<int> counts() async* {
  for (var i = 0; i < 9; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 2));
  }
}

void streamMethod() async {
  final stream = counts()
      .asBroadcastStream(); // asBroadcastStream(); olmasa error verir false gedir
  stream.listen((event) {
    // print(event);
  });
  stream.listen((event) {
    // print(event);
  });
  print(stream.isBroadcast.toString());
  print(await stream.first);
  print(await stream.last);
  // print(await stream.single); //sebebin arasdir yaz

  print(await stream.any((element) => element == 2));
  //herhangi bir eleman true dönerse bunu geriye dondurur
  stream.map((event) => event * 4).listen((event) {
    print(event);
  });
  final myStream = counts().listen((event) {});

  myStream.onData((data) {
    print("data yuklendi");
  });
  myStream.onError(() {});
  myStream.onDone(() {});
}
