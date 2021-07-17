#### What is Flutter?
Flutter is an open-source mobile application development framework (SDK) that allows developing
cross-platform application from a single codebase. (iOS and Android distribution)
Flutter applications are build using Dart programming language.

#### What is Dart?
Dart is general purpose object-oriented, garbage collected programming language used to
develop Flutter applications.

Dart can compile both AOT (ahead-of-time) and JIT (just-in-time).
- Dart is AOT compiled to fast predictable, native code which allows almost all of Flutter to be written in Dart. This
makes Flutter fast and highly customizable. AOT compilation is used when development is done and is ready
for release. Code is then compiled AOT to native code enabling fast startup and performant execution of the application.
- Dart can also be JIO compiled for exceptionally fast development cycles and game changing workflow. JIT is used
during application development process since it enables hot reload and fast development cycles byy compiling code at runtime.

Dart allows Flutter to avoid the need for a separate declarative languages like XML, for Android, or separate
visual interface builders because Dart's declarative, programmatic layout is easy to read and visualize. And
with all the layouts in one language and in one place, it is easy for Flutter to provide advanced tooling that makes layout s snap.

#### What is Flutter native?
Flutter uses graphics engine called Skia to perform all UI rendering on the application side. It
means that is does not depend on OEM widgets provided by the platform. It just needs platform
canvas to draw its own rendering. Almost everything in Flutter is a widget.

In contrast, React Native, React Native uses JavaScript bridge to convert its widgets. And since it does  
(compare & update lifecycle) constantly, it creates bottleneck and causes a drop in performance as a result.
Flutter does not use such bridge to convert its own widgets to OEM widgets.

#### Differentiate between Hot Reload and Hot Restart
Hot Reload:
- Hot Reload enables hot-swap code changes which app is running
- It takes less time thant Hot Restart
- There is also a drawback. States are not updated in Hot Reload
Hot Restart:
- Hot Restart destroys the preserved state value and set them to their default value
- The application Widget tree is completely rebuilt
- It takes much longer compared to Hot Restart

#### So... why Flutter?
- Modern API - designed to solve common needs for today's application development world and to be customizable
- Performs its own rendering (using Skia) and uses its own widgets - leads to predictability in UI,
meaning same UI shared by all versions of Android and iOS
- Fast UI rendering - outperforms any other cross-platform framework
- Code reuse - across Android and iOS in high percentages (most of the time higher than 90%)
- Full compilation of a Flutter application takes 15 seconds for a project that is built in ~2 minutes for Android
- Incremental compilation takes subsecond - thanks to Hot Reload feature
- Open source and backed by Google

#### What is the difference between `main()` and `runApp()`?
`main()` function stats the widget and is where all program start.  
`runApp()` function returns a Widget that would be attached to the screen as a root of the Widget tree that will be rendered.

#### Packages and Plugins in Flutter
- Packages allow you to import new Widgets or functionality into the application
- There is small difference between packages and plugins: Packages are usually new components or code written purely
in Dart where as Plugins work to allow more functionality on the device side using native code
- Usually on DartPub, both packages and plugins are referred to as packages and only while creating a new package is the
distinction clearly mentioned

#### Build Modes in Flutter
The flutter tooling supports three modes when compiling an application and a headless mode for resting.

Compilation mode can be chosen depending on where you're in the development cycle. Development, Profile and Release
are three different build modes available in Flutter.

### Required vs Optional parameter
- Dart required parameters are arguments that are passed to a function and the function required all those parameters to complete its code block.
- Optionals parameters are defined at the end of the parameter list, after any required parameters.
- Named optionals are wrapped by `{}`
- Positional parameters are wrapped by `[]`
- Default parameters assign a value to a parameter.