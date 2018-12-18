//
//  AnimationViewController.swift
//  CGVProject
//
//  Created by Wi on 18/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2, animations: {
            self.scrollView.contentOffset.x += 300
        }) { (isFinish) in
            if isFinish{
                
            }
        }
        // Do any additional setup after loading the view.
    }


}
