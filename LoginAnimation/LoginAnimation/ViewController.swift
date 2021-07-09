//
//  ViewController.swift
//  LoginAnimation
//
//  Created by LH on 2021/7/7.
//

import UIKit

class ViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 25/255.0, green: 153/255.0, blue: 3/255.0, alpha: 1)
        let loginImageView = UIImageView()
        loginImageView.frame = CGRect(x: 0, y: 50, width: 334, height: 101)
        loginImageView.center.x = self.view.center.x
        loginImageView.image = UIImage(named: "")
        self.view .addSubview(loginImageView)
        
        let height: CGFloat = isFullIphone() ? (50+30):50
        
        let loginBtn = UIButton()
        loginBtn.frame = CGRect(x: 0, y: self.view.bounds.size.height-height, width:  self.view.bounds.size.width/2, height:50 )
        loginBtn.backgroundColor = UIColor.lightGray
        loginBtn.addTarget(self, action: #selector(clickLeftBtn), for: .touchUpInside)
        loginBtn.setTitle("Login in", for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        self.view .addSubview(loginBtn)
        
        
        let signBtn = UIButton()
        signBtn.frame = CGRect(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height-height, width:  self.view.bounds.size.width/2, height: 50)
        signBtn.backgroundColor = UIColor(red: 42/255.0, green: 183/255.0, blue: 90/255.0, alpha: 1)
        signBtn.addTarget(self, action: #selector(clickLeftBtn), for: .touchUpInside)
        signBtn.setTitle("Sign up", for: .normal)
        signBtn.setTitleColor(.white, for: .normal)
        self.view .addSubview(signBtn)
        
        
        
        
        
        
        
    }
    @objc func clickLeftBtn() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }

    func isFullIphone() -> Bool {
        let height = UIScreen.main.bounds.size.height
        if height > 780.0 {
            return true
        }
        return false
    }
}

