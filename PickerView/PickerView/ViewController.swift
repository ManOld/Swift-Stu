//
//  ViewController.swift
//  PickerView
//
//  Created by LH on 2021/7/6.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emojiArr.count
    }
   
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLb = UILabel()
        pickerLb.text = emojiArr[row]
        pickerLb.textAlignment = .center
        pickerLb.font = UIFont.systemFont(ofSize: 60)
        return pickerLb
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 90
    }
    
    
    var pickerView : UIPickerView!
    var emojiArr = ["😁","😢","😎","🌙","✨","🐷","🍑","👎","🐯"]
    var resultLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       creatSlotMachine()
    }
    func creatSlotMachine() {
        pickerView = UIPickerView()
        pickerView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 220)
        self.view .addSubview(pickerView)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.center.x = self.view.center.x;
        pickerView.center.y = self.view.center.y - 50;
        pickerView.selectRow(Int(arc4random())%(emojiArr.count - 2) + 1, inComponent: 0, animated: false)
        pickerView.selectRow(Int(arc4random())%(emojiArr.count - 2) + 1, inComponent: 1, animated: false)
        pickerView.selectRow(Int(arc4random())%(emojiArr.count - 2) + 1, inComponent: 2, animated: false)
        
        
        print(self.pickerView.frame.maxY);
        
        
        let goBtn = UIButton();
        goBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 40);
        goBtn.center.x = self.view.center.x;
        goBtn.center.y = pickerView.frame.maxY + 50;
        goBtn.backgroundColor = UIColor.orange;
        goBtn.setTitle("Start", for: .normal)
        goBtn.setTitleColor(UIColor.white, for: .normal)
        goBtn.addTarget(self, action: #selector(clcikTheBtn), for: .touchUpInside)
        self.view .addSubview(goBtn)
        
        resultLabel = UILabel()
        resultLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 40);
        resultLabel.center.x = self.view.center.x;
        resultLabel.center.y = goBtn.frame.maxY + 60;
        resultLabel.text = "猜猜结果"
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont.systemFont(ofSize: 20)
        self.view .addSubview(resultLabel)
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapPress))
//        快速双击
        tapGes.numberOfTapsRequired = 2;
        goBtn.addGestureRecognizer(tapGes)
        
    }
    
    @objc func clcikTheBtn() {
        
        pickerView.selectRow(Int(arc4random())%(emojiArr.count - 2) + 1, inComponent: 0, animated: true)
        pickerView.selectRow(Int(arc4random())%(emojiArr.count - 2) + 1, inComponent: 1, animated: true)
        pickerView.selectRow(Int(arc4random())%(emojiArr.count - 2) + 1, inComponent: 2, animated: true)
        judge()
    }
    @objc func tapPress() {
        let result = Int(arc4random())%(emojiArr.count - 2)
        print("result:::\(result)")
        pickerView.selectRow(result + 1, inComponent: 0, animated: true)
        pickerView.selectRow(result + 1, inComponent: 1, animated: true)
        pickerView.selectRow(result + 1, inComponent: 2, animated: true)
        judge()
    }
    func judge() {
        if pickerView.selectedRow(inComponent: 0) == pickerView.selectedRow(inComponent: 1) && pickerView.selectedRow(inComponent: 1) == pickerView.selectedRow(inComponent: 2){
            resultLabel.text = "你中奖了！"
        }else{
            resultLabel.text = "小伙继续努力！"
        }
    }
}

