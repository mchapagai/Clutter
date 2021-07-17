Widgets are basically the UI components in Flutter. Flutter is considered as a tree of Widgets. Flutter builds entire UI components by composing 
smaller widgets to create a more complex widgets. This is called "Composition over Inheritance" in Object-Oriented Programming.


Widgets can be divided into two types:    
**StatefulWidget**: StatefulWidget does not require mutable state. In other words, StatefulWidget maintains the state that might change during lifecycle of the wisget. To change the StatefulWidget `setState()` should be claaed. Widget is then redrawn.
> Using `setState()` is a good practice because it sometimes causes weired behavios. Use **callback** instead of `setState()`.  

**StatelessWidget**: StatelessWidget has mutable state, meaning its property cannot change and should be final.

A StatelessWidget is static where as StatefulWidget is dynamic.    
StatelessWidget will never re-build by itself (but can from external events). A StatefulWidget can.

### Why do we pass function to Widget?
Functions are first class object in Dart and can be passed as a parameter to other functions. We pass a function to Widget essentially saying, "invoke this function when something happens".    
Callbacks using interface like Android have too much boilerplate code for a single callback. Dart does both declaration as well as setting up the callback. This becomes much more cleaner and organized and helps us avoid unnecessary complication.