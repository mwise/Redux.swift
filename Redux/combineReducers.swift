//
//  combineReducers.swift
//  Redux.swift
//
//  Created by Mark Wise on 11/4/15.
//  Copyright © 2015 InstaJams. All rights reserved.
//

import Foundation

private func getUndefinedStateErrorMessage(key: String, action: ReduxAction) -> String {
  return "Reducer \(key) returned undefined handling \(action.type). " +
    "To ignore an action, you must explicitly return the previous state.";
}

public func combineReducers(reducers: [String: Reducer]) -> Reducer {
  var defaultState = AppState();

  func combination(state: Any, action: ReduxAction) -> AppState {
    var appState = state as! AppState;

    for (key, reducer) in reducers {
      if let previousStateForKey = appState[key] {
        let nextStateForKey = reducer(previousState: previousStateForKey, action: action);
        appState[key] = nextStateForKey;
      }
    }
    return appState;
  }
  return combination;
}