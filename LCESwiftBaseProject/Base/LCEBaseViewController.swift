//
//  LCEBaseViewController.swift
//  LCESwiftBaseProject
//
//  Created by mac on 2020/5/9.
//  Copyright © 2020 iwchina. All rights reserved.
//

import UIKit

class LCEBaseViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = lceBgColor
        self.view.addSubview(naviView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        print("当前视图控制器:",self.classForCoder)
    }
    
    // MARK: - 懒加载
    lazy var naviView : LCENaviView = {
        let naviView = LCENaviView.init(frame: CGRect.zero)
        return naviView
    }()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
