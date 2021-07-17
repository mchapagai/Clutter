State is basically sharing the different features within the application (sometimes called shared state).

BLoC (Business Logic Component) is Flutter application architecture patterns to help separate business logic from UI code and using a fewer stateful widgets.
BLoC helps in managing the state and makes access to data from a central place in the project. This
gist of BLoC is everything in the application should be presented as streams of events; Widget submits
events; other widgets will respond. BLoC sits in the middle managing the conversations.

### Streams in Flutter/Dart
- Asynchronous programming in Dart is characterized by the Future and Stream classes.
- A Stream is a sequence of asynchronous events. It is like an asynchronus iterable-where, instrad of getting the next event when asked for it, the stream tells you that there is an event when it is ready.
- Streams can be created in many ways but they are all used in the same way [TODO add example code]
- Stream provides an asynchronous sequence of data.
- Data sequences include user-generated events and data read from files.
- You can process a stream using either await for or listen() from the Stream API.
- There are two kinds of streams: single subscription or broadcast.sequence of

`.ib/core/bloc_provider.dart`
##### Injection of the BLoC:
```dart
Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc> {
        blocBuilder: () => MoviesBloc(),
        child: MoviesScreen()
    }
}
```
- BLoC is available everywhere in the application. Using global Singleton means, instantiated once for all and not part of any Widget tree.
- A BLoC to be available anywhere in the application, we need to have to put BLoX as the parent of the MaterialApp

```dart
class ClutterApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClutterBloc>(
        blocBuilder: () => ClutterBloc()
        
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: setClutterDarkTheme(context),
        ),
        home: ClutterScreen(),
    );
  }
}
```