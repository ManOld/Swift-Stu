//
//  ViewController.swift
//  EnumView
//
//  Created by LH on 2021/7/6.
//

import UIKit

class ViewController: UIViewController {
    
    var blurView: UIVisualEffectView!
    var alphaBtn: UIButton!
    var quoteBtn: UIButton!
    var chatBtn: UIButton!
    var photoBtn: UIButton!
    var linkBtn: UIButton!
    var audioBtn: UIButton!
    let dumpingRate: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView.image = UIImage(named: "LaunchImage")
        self.view.addSubview(bgImageView)
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.view.addGestureRecognizer(tapGes)
        
    }
    @objc func tapAction() {
        self.setfunctions()
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = 1
        }
        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 5, options: .allowAnimatedContent) {
            self.alphaBtn.frame.origin.x = 60
            self.photoBtn.frame.origin.x = self.view.bounds.size.width - 60 - 88;
        } completion: { (Bool) in
            
        };
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: {
            self.quoteBtn.frame.origin.x = 60
            self.linkBtn.frame.origin.x = self.view.bounds.size.width - 60 - 88;
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: {
            self.chatBtn.frame.origin.x = 60
            self.audioBtn.frame.origin.x = self.view.bounds.size.width - 60 - 88;
        }, completion: nil)
    }
    @objc func removeAction() {
        UIView.animate(withDuration: 0.5, delay:0, usingSpringWithDamping: 3, initialSpringVelocity: 1, options: .allowAnimatedContent) {
            self.blurView.alpha = 0;
            self.alphaBtn.frame.origin.x = -88
            self.quoteBtn.frame.origin.x = -88
            self.chatBtn.frame.origin.x = -88
            self.linkBtn.frame.origin.x = self.view.bounds.size.width + 88
            self.photoBtn.frame.origin.x = self.view.bounds.size.width + 88
            self.audioBtn.frame.origin.x = self.view.bounds.size.width + 88
        } completion: { (Bool) in
            self.blurView.removeFromSuperview()
            self.alphaBtn.removeFromSuperview()
            self.quoteBtn.removeFromSuperview()
            self.chatBtn.removeFromSuperview()
            self.linkBtn.removeFromSuperview()
            self.photoBtn.removeFromSuperview()
            self.audioBtn.removeFromSuperview()
        };
    }
    func setfunctions() {
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view .addSubview(blurView)
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(removeAction))
        blurView.addGestureRecognizer(tapGes)
        
        alphaBtn = UIButton(frame: CGRect(x: -88, y: 80, width: 88, height: 88))
        alphaBtn .setImageAndTitle(imageName: "alpha", title: "message", type: .ButtonImagePositionTop, space: 10)
        blurView.contentView.addSubview(alphaBtn)
        
        quoteBtn = UIButton(frame: CGRect(x: -88, y: 246, width: 88, height: 88))
        quoteBtn .setImageAndTitle(imageName: "Quote", title: "Quote", type: .ButtonImagePositionTop, space: 10)
        blurView.contentView.addSubview(quoteBtn)
        
        chatBtn = UIButton(frame: CGRect(x: -88, y: 406, width: 88, height: 88))
        chatBtn .setImageAndTitle(imageName: "Chat", title: "Chat", type: .ButtonImagePositionTop, space: 10)
        blurView.contentView.addSubview(chatBtn)
        
        photoBtn = UIButton(frame: CGRect(x: self.view.frame.width+88, y: 80, width: 88, height: 88))
        photoBtn .setImageAndTitle(imageName: "Photo", title: "Photo", type: .ButtonImagePositionTop, space: 10)
        blurView.contentView.addSubview(photoBtn)
        
        linkBtn = UIButton(frame: CGRect(x: self.view.frame.width+88, y: 246, width: 88, height: 88))
        linkBtn .setImageAndTitle(imageName: "Link", title: "Link", type: .ButtonImagePositionTop, space: 10)
        blurView.contentView.addSubview(linkBtn)
        
        audioBtn = UIButton(frame: CGRect(x: self.view.frame.width+88, y: 406, width: 88, height: 88))
        audioBtn .setImageAndTitle(imageName: "Audio", title: "Audio", type: .ButtonImagePositionTop, space: 10)
        blurView.contentView.addSubview(audioBtn)
        
    }
}

