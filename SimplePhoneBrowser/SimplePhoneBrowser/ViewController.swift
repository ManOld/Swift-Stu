//
//  ViewController.swift
//  SimplePhoneBrowser
//
//  Created by LH on 2021/6/28.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{
    var imageView:UIImageView!
    var scrollView:UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView.init(frame: self.view.bounds)
        scrollView = UIScrollView.init(frame: self.view.frame)
        self.view .addSubview(scrollView)
        scrollView.addSubview(imageView)
        imageView.isUserInteractionEnabled = true
        imageView.contentMode  = UIView.ContentMode.scaleAspectFit;
        scrollView.maximumZoomScale = 4.0
        scrollView.minimumZoomScale = 1
        scrollView.backgroundColor = UIColor.black
        scrollView.delegate = self
        scrollView.contentSize = imageView.bounds.size
        let lhimage = UIImage(named: "lh")
        imageView.image = lhimage
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

}

