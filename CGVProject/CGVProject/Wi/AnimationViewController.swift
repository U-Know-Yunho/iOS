//
//  AnimationViewController.swift
//  CGVProject
//
//  Created by Wi on 18/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    let imageView = UIImageView()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        imageView.image = UIImage(named: "yuno1")

        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
        imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        imageView.heightAnchor.constraint(equalToConstant: 700)
        imageView.widthAnchor.constraint(equalToConstant: 600)
        
        
        UIView.animate(withDuration: 2, animations: {
            self.scrollView.contentOffset.x += 300
        }) { (isFinish) in
            if isFinish{
                self.dismiss(animated: false, completion: nil)
            }
        }
        // Do any additional setup after loading the view.
    }


}
