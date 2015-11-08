//
//  ViewController.swift
//  ReduxSwiftDemo-iOS
//
//  Created by Mark Wise on 11/7/15.
//
//

import UIKit
import Redux

private let store = CounterStore.sharedInstance;
private let actions = bindActionCreators(CounterActionCreators, dispatch: store.dispatch)

class ViewController: UIViewController {
  var label:  UILabel!;

  override func viewDidLoad() {
    super.viewDidLoad()

    label = UILabel(frame: CGRectMake(10, 100, view.frame.width, 40))

    view.addSubview(label)

    func render() {
      let state = store.getState() as! AppState
      let count = state["count"] as! Int;
      label.text = "You've clicked \(count) times."
    }

    _ = store.subscribe(listener: render);
    render()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    actions["Increment"]!()
  }
}

