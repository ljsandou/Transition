//
//  TransitionManger.swift
//  Transition
//
//  Created by 三斗 on 6/17/16.
//  Copyright © 2016 com.streamind. All rights reserved.
//

import UIKit

class TransitionManger: NSObject,UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate {
  var present = false
  var lowOffset:CGFloat = 0
  var middleOffset:CGFloat = 400
  var highOffset:CGFloat = 600
  
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return 1
  }
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView()
    let screen:(from:UIViewController,to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!,(transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey))!)
    
    let popViewController = !present ? screen.from as! PopViewController:screen.to as! PopViewController
    containerView?.addSubview(popViewController.view)
    
    if present{
      popUp(popViewController)
    }
    
    let duration = transitionDuration(transitionContext)
    UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .CurveEaseIn, animations: {
      self.present ? self.popDown(popViewController):self.popUp(popViewController)
    }) { (finish) in
      transitionContext.completeTransition(true)
    }
  }
  
  func popUp(viewController:PopViewController){
    viewController.view.alpha = 0
    viewController.audioImageView.transform = makeTranslation(lowOffset, offsetValueHeight: middleOffset)
    viewController.audioLabel.transform = makeTranslation(lowOffset, offsetValueHeight: middleOffset)
    viewController.quoteImageView.transform = makeTranslation(lowOffset, offsetValueHeight: middleOffset)
    viewController.quoteLabel.transform = makeTranslation(lowOffset, offsetValueHeight: middleOffset)
    
    viewController.chatImageView.transform = makeTranslation(lowOffset, offsetValueHeight: highOffset)
    viewController.chatLabel.transform = makeTranslation(lowOffset, offsetValueHeight: highOffset)
    viewController.photoImageView.transform = makeTranslation(lowOffset, offsetValueHeight: highOffset)
    viewController.Photo.transform = makeTranslation(lowOffset, offsetValueHeight: highOffset)
  }
  
  func popDown(viewController:PopViewController){
    viewController.view.alpha = 1
    viewController.audioImageView.transform = CGAffineTransformIdentity
    viewController.audioLabel.transform = CGAffineTransformIdentity
    viewController.quoteImageView.transform = CGAffineTransformIdentity
    viewController.quoteLabel.transform = CGAffineTransformIdentity
    
    viewController.chatImageView.transform = CGAffineTransformIdentity
    viewController.chatLabel.transform = CGAffineTransformIdentity
    viewController.photoImageView.transform = CGAffineTransformIdentity
    viewController.Photo.transform = CGAffineTransformIdentity
    
  }
  
  
  func makeTranslation(offsetValueWidth:CGFloat,offsetValueHeight:CGFloat) -> CGAffineTransform{
    return  CGAffineTransformMakeTranslation(offsetValueWidth, offsetValueHeight)
  }
  
  func returnToInit() -> CGAffineTransform{
    return CGAffineTransformIdentity
  }
  
  func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    present = true
    return self
  }
  func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    present = false
    let viewController = dismissed as! PopViewController
    UIView.animateWithDuration(0.2) {
      print("aaa")
      viewController.animateButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
    }
    
    return self
  }
}


