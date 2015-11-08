//
//  createStore.swift
//  Redux.swift
//
//  Created by Mark Wise on 11/4/15.
//  Copyright © 2015 InstaJams. All rights reserved.
//

import Foundation

public func createStore(reducer: Reducer, initialState: Any) -> ReduxStore {
  var currentReducer = reducer;
  var currentState = initialState;
  var listeners = [Listener]();
  var isDispatching = false;

  func getState() -> State {
    return currentState;
  }

  func subscribe(listener: Listener) -> () -> Void {
    listeners.append(listener);
    let index = listeners.count - 1;
    var isSubscribed = true;

    func unsubscribe() {
      if (!isSubscribed) {
        return;
      }

      isSubscribed = false;
      _ = listeners.removeAtIndex(index);
    }
    return unsubscribe;
  }

  func dispatch(action: ReduxAction) throws -> ReduxAction {
    if (isDispatching) {
      throw ReduxSwiftError.ReducerDispatchError;
    }

    defer {
      isDispatching = false;
    }

    isDispatching = true;
    currentState = currentReducer(previousState: currentState, action: action);

    for listener in listeners {
      listener()
    }

    return action;
  }

  func replaceReducer(nextReducer: Reducer) -> Void {
    currentReducer = nextReducer;

    do {
      try dispatch(ReduxAction(payload: nil, type: ActionTypes.Init))
    } catch {
      print("ERROR: Reducers may not dispatch actions.");
    }
  }

  do {
    try dispatch(ReduxAction(payload: nil, type: ActionTypes.Init))
  } catch {
    print("ERROR: Reducers may not dispatch actions.");
  }

  return ReduxStore(dispatch: dispatch, getState: getState, replaceReducer: replaceReducer, subscribe: subscribe);
}