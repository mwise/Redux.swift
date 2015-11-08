//
//  CounterStore.swift
//  ReduxSwiftDemo-iOS
//
//  Created by Mark Wise on 11/5/15.
//  Copyright © 2015 InstaJams. All rights reserved.
//

import Foundation
import Redux

class CounterStore {
  static let sharedInstance : ReduxStore = generateStore()
}

private func generateStore() -> ReduxStore {
  var initialState = AppState()
  initialState["count"] = 0

  let reducers: [String: Reducer] = [
    "count": counterReducer,
  ]

  return createStore(combineReducers(reducers), initialState: initialState)
}