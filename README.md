# Redux.swift
Redux implementation for Swift projects
Predictable state container for Swift apps. Inspired by http://redux.js.org

# Installation

via [Carthage](https://github.com/Carthage/Carthage):

1. Add `github "mwise/Redux.swift"` to your Cartfile
2. Run `carthage update`
2. Drag `Carthage/Build/Redux.framework` into your app target's `General -> Linked Frameworks and Binaries`
3. Add `Carthage/Build/Redux.framework` into your `/usr/local/bin/carthage copy-frameworks` Run Script's `Input Files`


# Usage

```swift
import Redux

// The top-level app state is of type [String: Any] aka AppState
var initialState: AppState = ["count": 0]

/**
 * The only way to change the app state is to dispatch actions
 * Action types are defined as enums that implements ReduxActionType
 */
enum CountActions : ReduxActionType {
  case Decrement
  case Increment
}

/**
 * This is a reducer, a pure function with (state, action) -> state signature.
 * It describes how an action transforms the state into the next state.
 *
 * The shape of the state is up to you (i.e it is of Any type). You should cast 
 * the state as whatever type you are returning (e.g. Int in the example below). 
 * The only important part is that you should not mutate the state object, but 
 * return a new object if the state changes.
 *
 * In this example, we use a `switch` statement to check the Action type, but you 
 * can use a helper that follows a different convention (such as function maps) 
 * if it makes sense for your project.
 */
func countReducer(previousState: Any, action: ReduxAction) -> Int {
  var count = previousState as! Int;

  switch action.type {
  case CountActions.Increment:
    count = count + 1;
  case CountActions.Decrement:
    count = count - 1;
  default:
    break;
  }
  return count
}

// map individual reducers to the top-level app state shape
let reducers: [String: Reducer] = [
  "count": countReducer,
]

// combine individual reducers into a final reducer
let finalReducer = combineReducers(reducers)

// Create a Redux store holding the state of your app.
// Its API is { subscribe, dispatch, getState }.
let store = createStore(finalReducer, initialState: initialState)

// define a listener function to handle app state changes
func onChange() {
  let state = store.getState() as! AppState
  print(state)
}

// subscribe to app state changes (returns the unsubscribe function)
let unsubscribe = store.subscribe(listener: onChange);

// Dispatch some actions to change the app state and trigger listeners
do {
  try store.dispatch(action: ReduxAction(payload: nil, type: CountActions.Increment))
  // ["count": 1]
  try store.dispatch(action: ReduxAction(payload: nil, type: CountActions.Increment))
  // ["count": 2]
  try store.dispatch(action: ReduxAction(payload: nil, type: CountActions.Decrement))
  // ["count": 0]
} catch {
  print("Error dispatching increment action")
}

// remove the change listener we added previously
unsubscribe()
```

# Demo

1. Open `Redux.swift.xcodeproj`
2. Select the `ReduxSwiftDemo-iOS` target
3. Use `Menu -> Product -> Run` or `cmd-R` to run

# License

MIT
