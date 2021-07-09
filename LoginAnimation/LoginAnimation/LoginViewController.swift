//
//  LoginViewController.swift
//  LoginAnimation
//
//  Created by LH on 2021/7/7.
//

import UIKit

class LoginViewController: UIViewController {
    
    var userNameTf:UITextField!
    var passWordTf:UITextField!
    var loginBtn:UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let userNameTf = UITextField()
        userNameTf.frame = CGRect(x: 50, y: 120, width: self.view.bounds.size.width - 100 , height: 40)
        self.view .addSubview(userNameTf)
        userNameTf.layer.borderWidth = 1
        userNameTf.layer.borderColor = UIColor.black.cgColor
        
        let passWordTf = UITextField()
        passWordTf.frame = CGRect(x: 50, y: 180, width: self.view.bounds.size.width - 100 , height: 40)
        self.view .addSubview(passWordTf)
        passWordTf.layer.borderWidth = 1
        passWordTf.layer.borderColor = UIColor.black.cgColor
        
        let loginBtn = UIButton()
        loginBtn.frame = CGRect(x: 50, y: 240, width: self.view.bounds.size.width - 100 , height: 40)
        loginBtn.backgroundColor = UIColor(red: 42/255.0, green: 183/255.0, blue: 90/255.0, alpha: 1)
        loginBtn.addTarget(self, action: #selector(clickLeftBtn(btn:)), for: .touchUpInside)
        loginBtn.setTitle("NEXT", for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        self.view .addSubview(loginBtn)
        
    }
    
    
    @objc func clickLeftBtn(btn:UIButton) {
        let animation = CAKeyframeAnimation(keyPath: "anchorPoint") //transform.rotation
        animation.duration = 0.2;
        animation.values = [CGPoint(x: 0.45, y: 0.5),CGPoint(x: 0.55, y: 0.5),CGPoint(x: 0.45, y: 0.5),CGPoint(x: 0.55, y: 0.5),CGPoint(x: 0.45, y: 0.5),CGPoint(x: 0.55, y: 0.5),CGPoint(x: 0.45, y: 0.5),CGPoint(x: 0.55, y: 0.5),];
        animation.repeatCount = 1;
        //设置是否原路返回默认为不
//        animation.autoreverses = true;
        //设置移动速度，越小越快
//        animation.duration = 0.2;
//        animation.isRemovedOnCompletion = false;
//        animation.fillMode = CAMediaTimingFillMode.forwards;
        btn.layer.add(animation, forKey: "")
    }
    func animationWithUI() {
        
    }
    
}
