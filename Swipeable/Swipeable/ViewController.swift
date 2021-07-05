//
//  ViewController.swift
//  Swipeable
//
//  Created by LH on 2021/6/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    
    private let cellHeight:CGFloat = 66
    private let colorRatio:CGFloat = 10
    private var actionController:UIAlertController!
    var table:UITableView!
    private let lyric = "我和我的祖国一刻也不能分割,无论我走到哪里都流出一首赞歌,我歌唱每一座高山我歌唱每一条河,袅袅炊烟小小村落路上一道辙,你用你那母亲的脉搏和我诉说,我的祖国和我像海和浪花一朵,浪是海的赤子海是那浪的依托,每当大海在微笑我就是笑的旋涡,我分担着海的忧愁分享海的欢乐,永远给我碧浪清波心中的歌,啦啦…永远给我碧浪清波心中的歌"
    private var dataSource:Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView(frame: self.view.bounds)
        //        table.setEditing(true, animated: true)
        self.view .addSubview(table)
        table.delegate = self
        table.dataSource = self
        //        table.separatorStyle = .none
        dataSource = lyric.split(separator: ",").map(String.init)
        actionController = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.selectionStyle = .none;
        cell.textLabel?.textColor = UIColor.black        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            // 当点击了删除按钮
            dataSource.remove(at: indexPath.row)
            // 刷新
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.bottom)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let more = UIContextualAction(style: .destructive, title: "编辑") {
            (action, view, completionHandler) in
            //.......
            let alertController = UIAlertController(title: "系统提示",
                                                    message: "您确定要编辑吗？", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in
                print("点击了确定")
            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            completionHandler(true)
        }
        more.backgroundColor = UIColor .green
        //创建“旗标”事件按钮
        let favorite = UIContextualAction(style: .normal, title: "旗标") {
            (action, view, completionHandler) in
            //.......
            completionHandler(true)
        }
        favorite.backgroundColor = UIColor .blue
        //创建“删除”事件按钮
        let delete = UIContextualAction(style: .destructive, title: "删除") {
            (action, view, completionHandler) in
            //.......
            completionHandler(true)
        }
        
        //返回所有的事件按钮
        let configuration = UISwipeActionsConfiguration(actions: [delete, favorite, more])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    
    
    
    @IBAction func userDidEditBtn(_ sender: UIBarButtonItem) {
        table.setEditing(!table.isEditing, animated: true)
    }
    
    
    
    
    
}

