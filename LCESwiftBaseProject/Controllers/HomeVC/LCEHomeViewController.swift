//
//  LCEHomeViewController.swift
//  LCESwiftBaseProject
//
//  Created by mac on 2020/5/9.
//  Copyright © 2020 iwchina. All rights reserved.
//

import UIKit

class LCEHomeViewController: LCEBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.naviView.navTitle = "首页"
        self.naviView.isHiddenBackButton = true
        
    }

}
