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
        
        self.view .addSubview(self.button)
        
    }
    
    @objc func touchButtonAction(sender: UIButton) -> Void {
        print("哈哈哈哈")
    }
    
    lazy var button: UIButton = {
        let button = UIButton.init(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 160, height: 70)
        button.center = self.view.center
        button.setTitle("点击", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(self, action: #selector(touchButtonAction(sender:)), for: .touchUpInside)
        return button
    }()

}
