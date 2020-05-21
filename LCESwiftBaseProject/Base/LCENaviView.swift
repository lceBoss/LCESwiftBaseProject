//
//  LCENaviView.swift
//  LCESwiftBaseProject
//
//  Created by mac on 2020/5/18.
//  Copyright © 2020 iwchina. All rights reserved.
//

import UIKit
import SnapKit

class LCENaviView: UIView {

    override init(frame: CGRect) {
        super.init(frame:CGRect(x: 0, y: 0, width: LCE_SCREEN_WIDTH, height: LCE_NAV_HEIGHT))
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() -> Void {
        self.backgroundColor = .white
        self.addSubview(self.bgImageView)
        self.addSubview(self.middleView)
        self.addSubview(self.leftView)
        self.addSubview(self.rightView)
        self.updateLayoutConstraints()
    }
    
    func updateLayoutConstraints() {
        
        self.bgImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        self.middleView.snp.makeConstraints { (make) in
            make.top.equalTo(LCE_StatusBar_H)
            make.bottom.equalToSuperview()
            make.width.equalTo(LCE_SCREEN_WIDTH * 1 / 2)
            make.centerX.equalToSuperview()
        }
        
        self.leftView.snp.makeConstraints { (make) in
            make.top.equalTo(LCE_StatusBar_H)
            make.left.equalToSuperview()
            make.right.equalTo(self.middleView.snp.left)
            make.bottom.equalToSuperview()
        }
        
        self.rightView.snp.makeConstraints { (make) in
            make.top.equalTo(LCE_StatusBar_H)
            make.right.equalToSuperview()
            make.left.equalTo(self.middleView.snp.right)
            make.bottom.equalToSuperview()
        }
        
        self.leftButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(6)
            make.width.equalTo(40)
            make.top.bottom.equalToSuperview()
        }
        
        self.rightButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-8)
            make.width.equalTo(40)
            make.top.bottom.equalToSuperview()
        }
        
        self.middleButton.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    // MARK: - 设置内容
    // 设置导航标题
    open var navTitle: String? {
        didSet{
            self.middleButton.setTitle(navTitle, for: .normal)
        }
    }
    // 隐藏返回按钮
    public var isHiddenBackButton: Bool? {
        didSet {
            if let isHidden = isHiddenBackButton {
                self.leftButton.isHidden = isHidden
            }
        }
    }
    
    // MARK: - 懒加载
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.contentMode = UIView.ContentMode.scaleAspectFill
        bgImageView.clipsToBounds = true
        return bgImageView
    }()
    
    lazy var leftView : UIView = {
        let leftView = UIView()
        leftView.addSubview(self.leftButton)
        return leftView
    }()

    lazy var middleView : UIView = {
        let middleView = UIView()
        middleView.addSubview(self.middleButton)
        return middleView
    }()

    lazy var rightView : UIView = {
        let rightView = UIView()
        rightView.addSubview(self.rightButton)
        return rightView
    }()
    
    lazy var leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.setTitleColor(lceTextColor, for: .normal)
        leftButton.titleLabel?.font = .systemFont(ofSize: 16)
        leftButton.titleLabel?.textAlignment = .left
        leftButton.setImage(UIImage(named: "icon_back_gray"), for: .normal)
        return leftButton
    }()
    
    lazy var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setTitleColor(lceTextColor, for: .normal)
        rightButton.titleLabel?.font = .systemFont(ofSize: 16)
        rightButton.titleLabel?.textAlignment = .right
        return rightButton
    }()
    
    lazy var middleButton: UIButton = {
        let middleButton = UIButton()
        middleButton.setTitleColor(lceTextColor, for: .normal)
        middleButton.titleLabel?.font = .systemFont(ofSize: 17)
//        middleButton.titleLabel?.font = UIFont.init(name: "Helvetica-Bold", size: 17)
        middleButton.titleLabel?.textAlignment = .center
        return middleButton
    }()
    
}
