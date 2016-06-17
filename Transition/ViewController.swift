//
//  ViewController.swift
//  Transition
//
//  Created by 三斗 on 6/16/16.
//  Copyright © 2016 com.streamind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let transionManger = TransitionManger()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func close(segue:UIStoryboardSegue){
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let toViewController = segue.destinationViewController as? PopViewController{
      toViewController.transitioningDelegate = self.transionManger
    }
  }
}

