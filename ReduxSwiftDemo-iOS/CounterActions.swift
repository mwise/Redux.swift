//
//  CounterActionCreators.swift
//  ReduxSwiftDemo-iOS
//
//  Created by Mark Wise on 11/6/15.
//  Copyright © 2015 InstaJams. All rights reserved.
//

import Foundation
import Redux

private func increment(args: Any...) -> ReduxAction {
  return ReduxAction(payload: nil, type: CounterActions.Increment)
}

let CounterActionCreators = [
  "Increment": increment as ActionCreator,
  "Decrement": { (args: Any...) -> ReduxAction in
    return ReduxAction(payload: nil, type: CounterActions.Decrement)
  } as ActionCreator
]

enum CounterActions : ReduxActionType {
  case Decrement
  case Increment
}