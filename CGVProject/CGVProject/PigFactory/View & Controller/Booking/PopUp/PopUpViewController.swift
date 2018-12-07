//
//  PopUpViewController.swift
//  CGVProject
//
//  Created by PigFactory on 29/11/2018.
//  Copyright © 2018 PigFactory. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var baseWindow: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseWindow.layer.cornerRadius = 10
    }
    

    @IBAction func setupButtonTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
