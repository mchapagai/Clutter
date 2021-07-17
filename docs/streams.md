Streams represents flux of data and events. Streams allow to listen to data and event changes.

- Asynchronous programming in Dart is characterized by the `Future` and `Stream` classes.
- A Stream is a sequence of asynchronous events. It is like an asynchronous iterable-where, instead
of getting the next event  when asked for it, the stream tells you that there is an event when it is ready.
- Streams provides an asynchronous sequence of data.
- Data sequences include user-generated events and data read from files.
- You can process a Stream using either `await` for a `listen()` from the Stream API.
- There are two kinds of Streams: Single Subscription or Broadcast.

#### Single Subscription Streams:
- The most common kind of Streams.
- It contains a sequence of events that are parts of a larger whole. Events need to be delivered
in correct order and without missing any of them.
- This is the kind of stream you get when you read a file or receive a web request.
- Such a stream can only be listened once. Listening again later could mean missing out on initial events, and then the rest of the stream makes no sense.
- When you start listening, the data will be fetched and provided in chunks.

### Broadcast Streams
- It is intended for individual messages that can be handled one at a time. This kind of Streams can be used for mouse events in a browser, for example.
- You can start listening to such stream at anytime, and you get the events that are fired while you listened.
- More than one  listener can listen at the same time, and you can listen again later after cancelling a previous subscription.


#### What are null aware operators?
- Dart offers some handy operators for dealing with values that might be null.
- Once is the `??=` assignment operator, which assigns a value to a variable only if that variable is currently null
- Another null-aware operator is `??`, which returns the expression in its left unless that expression's value is null, in which case it evaluates and returns the expression on its right.

