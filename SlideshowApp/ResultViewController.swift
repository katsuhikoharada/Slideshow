//
//  ResutlViewController.swift
//  SlideshowApp
//
//  Created by 原田　克彦 on 2018/04/01.
//  Copyright © 2018年 katsuhiko.harada. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

 

    @IBOutlet weak var imageView: UIImageView!
    
    var imageName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named:imageName)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
