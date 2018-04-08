//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 原田　克彦 on 2018/03/25.
//  Copyright © 2018年 katsuhiko.harada. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    var dispImageNo = 0
    var slideshowStart = false
    var timer: Timer!
    var running = false
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBOutlet weak var imageView: UIImageView!
    

    @IBAction func onTapimage(_ sender: Any) {
        performSegue(withIdentifier:"result", sender: nil)
    }
    @IBAction func onPrev(_ sender: Any) {
        dispImageNo -= 1
        displayImage()
    }
    @IBAction func onNext(_ sender: Any) {
        dispImageNo += 1
        displayImage()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //次の画面に画像のフィアイル名を引き渡す
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        let imageNameArray = [
            "IMG_0065.jpg",
            "IMG_0061.jpg",
            "IMG_0041.jpg",
            "IMG_0063.jpg",
            "IMG_0069.jpg",
            ]
        let name = imageNameArray[dispImageNo]
        
      resultViewController.imageName = name//"IMG_0065.jpg"//今表示している画像の情報
    }
    @IBAction func startstop(_ sender: Any) {
  //     if runnig{
     
       
//      backButton.setTitle(<#T##title: String?##String?#>, for: <#T##UIControlState#>)
//       }
        if self.timer == nil {
         backButton.isEnabled = false
         nextButton.isEnabled = false
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        else {
            backButton.isEnabled = true
            nextButton.isEnabled = true
            self.timer.invalidate()
            self.timer = nil
        }
    }
    @objc func updateTimer(timer: Timer) {
        dispImageNo += 1
        displayImage()
    }
    
    func displayImage(){
        let imageNameArray = [
            "IMG_0065.jpg",
            "IMG_0061.jpg",
            "IMG_0041.jpg",
            "IMG_0063.jpg",
            "IMG_0069.jpg",
            ]
        if dispImageNo < 0 {
            dispImageNo = 4
        }
        if dispImageNo > 4 {
            dispImageNo = 0
        }
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "IMG_0065.jpg")
        imageView.image = image
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapimage(_:))))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
