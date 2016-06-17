//
//  PopViewController.swift
//  Transition
//
//  Created by 三斗 on 6/16/16.
//  Copyright © 2016 com.streamind. All rights reserved.
//

import UIKit
class PopViewController: UIViewController {
  var tapGesture:UITapGestureRecognizer!
  
  @IBOutlet weak var audioImageView: UIImageView!
  @IBOutlet weak var audioLabel: UILabel!
  @IBOutlet weak var quoteImageView: UIImageView!
  @IBOutlet weak var quoteLabel: UILabel!
  @IBOutlet weak var chatImageView: UIImageView!
  @IBOutlet weak var chatLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var Photo: UILabel!
  @IBOutlet weak var animateButton: UIButton!
  enum Action {
    case Audio,Quote,Chat,Photo
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    audioImageView.userInteractionEnabled = true
    addTarget(audioImageView,mode: .Audio)
    quoteImageView.userInteractionEnabled = true
    addTarget(quoteImageView,mode: .Quote)
    chatImageView.userInteractionEnabled = true
    addTarget(chatImageView,mode: .Chat)
    photoImageView.userInteractionEnabled = true
    addTarget(photoImageView,mode:  .Photo)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  func addTarget(image:UIImageView,mode:Action){
    switch mode {
    case .Audio:
      tapGesture = UITapGestureRecognizer(target: self, action: #selector(PopViewController.audio))
    case .Quote:
      tapGesture = UITapGestureRecognizer(target: self, action: #selector(PopViewController.quote))
    case .Chat:
      tapGesture = UITapGestureRecognizer(target: self, action: #selector(PopViewController.chat))
    case .Photo:
      tapGesture = UITapGestureRecognizer(target: self, action: #selector(PopViewController.phote))
    }
    image.addGestureRecognizer(tapGesture)
  }
  
  func audio(){
    print("audio")
  }
  
  func quote(){
    print("quote")
  }
  
  func chat(){
    print("chat")
  }
  
  func phote(){
    print("photo")
  }
  
}
