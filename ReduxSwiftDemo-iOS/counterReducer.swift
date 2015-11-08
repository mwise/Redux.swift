//
//  counterReducer.swift
//  ReduxSwiftDemo-iOS
//
//  Created by Mark Wise on 11/6/15.
//  Copyright © 2015 InstaJams. All rights reserved.
//

import Foundation
import Redux

typealias CounterSchema = Int

func counterReducer(previousState: Any, action: ReduxAction) -> CounterSchema {
  var count = previousState as! CounterSchema;

  switch action.type {
  case CounterActions.Increment:
    count = count + 1;
  case CounterActions.Decrement:
    count = count - 1;
  default:
    break;
  }
  return count
}