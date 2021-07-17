## Architecture
```
|- UI
        |- Widgets
|- Data Manager
        |- BLoC, ChangeNotifier
|- model
        |- ViewModels
|- API
        |- RestFUL service call or Remote dats source
        |- Response objects
|- Repository
        |- Contract that holds the data from the service and pass it to the data manager, BLoC        
```

Flow: API is where the services are defined. Repository is a contract that talks to the service and pass data to the BLoC.    
BLoC is the responsible for retrieving the response from the service call and save into the viewmodel. Then, view model holds the data that user interface needs.

> API -> Repository -> BLoC -> UI