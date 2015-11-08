//
//  types.swift
//  Redux.swift
//
//  Created by Mark Wise on 11/6/15.
//  Copyright © 2015 InstaJams. All rights reserved.
//

import Foundation

public typealias ActionCreator = (args: Any...) -> ReduxAction;
public typealias ActionType = String
public typealias AppState = [String: Any];
public typealias DispatchFunction = (action: ReduxAction) throws -> ReduxAction;
public typealias FunctionWithArgs = (args: Any...) -> Void;
public typealias Listener = () -> Void;
public typealias Reducer = (previousState: Any, action: ReduxAction) -> Any;
public typealias State = Any;

public enum ActionTypes : ReduxActionType {
  case Init
}

public protocol ReduxActionType {}

public struct ReduxAction {
  public var payload: Any?;
  public var type: ReduxActionType

  public init(payload: Any?, type: ReduxActionType) {
    self.payload = payload;
    self.type = type;
  }
}

public struct ReduxStore {
  public var dispatch: DispatchFunction;
  public var getState: () -> State;
  public var replaceReducer: (nextReducer: Reducer) -> Void;
  public var subscribe: (listener: Listener) -> () -> Void;

  public init(dispatch: DispatchFunction, getState: () -> State, replaceReducer: (nextReducer: Reducer) -> Void, subscribe: (listener: Listener) -> () -> Void) {
    self.dispatch = dispatch
    self.getState = getState
    self.replaceReducer = replaceReducer
    self.subscribe = subscribe
  }
}

public enum ReduxSwiftError: ErrorType {
  case ReducerDispatchError
}