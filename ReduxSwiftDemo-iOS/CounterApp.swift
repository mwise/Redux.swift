//
//  Counter.swift
//  ReduxSwiftDemo-iOS
//
//  Created by Mark Wise on 11/4/15.
//  Copyright © 2015 InstaJams. All rights reserved.
//

//import Redux

private let store = CounterStore.sharedInstance;

//class CounterApp : Component<Any> {
//  let actions = bindActionCreators(CounterActionCreators, dispatch: store.dispatch)
//
//  override init(initialState: Any) {
//    super.init(initialState: initialState)
//  }
//
//  override func render() -> Element {
//    let decodedState = state as! AppState
//    let count = decodedState["count"] as! Int
//
//    return View()
//      .justification(.Center)
//      .childAlignment(.Center)
//      .direction(.Column)
//      .children([
//        Label("You've clicked \(count) times!"),
//        Button(attributedTitle: NSAttributedString(string: "Click me!"), action: { self.actions["Increment"]!() })
//          .margin(Edges(uniform: 10))
//          .width(100),
//        ])
//  }
//}