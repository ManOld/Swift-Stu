//
//  ViewController.swift
//  PullToRefresh
//
//  Created by LH on 2021/6/24.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LHTableViewCell =  tableView.dequeueReusableCell(withIdentifier: "LHTableViewCell", for: indexPath) as! LHTableViewCell
        if dataSouce.count > 0  {
            cell.cellModel = dataSouce[indexPath.row]
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:LHTableViewCell = tableView .cellForRow(at: indexPath) as! LHTableViewCell
        cell.setSelected(false, animated: true)
    }
    var dataSouce = Array<DetailModel>()
    let refresh = UIRefreshControl()
    var table:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView(frame: self.view.bounds)
        table.frame.origin.y = 44
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.view .addSubview(table)
        refresh.attributedTitle = NSAttributedString(string: "没有了，别拉了")
        refresh .addTarget(self, action: #selector(pullDown), for: .valueChanged)
        table.register(LHTableViewCell.self, forCellReuseIdentifier: "LHTableViewCell")
        table .addSubview(refresh)
        
    }
    
    
    @objc func pullDown() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            self.addNewElecmentToArray()
        }
       
        
        
    }
    
    func addNewElecmentToArray() {
        for _ in 1...15 {
            let detailModel = DetailModel.init()
            detailModel.contentText = "整个灯光秀将从1921年到2021年追溯建党伟业的百年脚步，分新民主主义革命时期、社会主义革命建设时期、改革开放和现代化建设新时期、社会主义新时代四个篇章，展现武汉为红色新中国奠基、建设时期武字头企业开启近现代中国工业、改革开放时期汉正街和汉产名牌拉开全国城市商品流通帷幕、现代化发展时期武汉在桥梁、隧道、高铁、航天军工、生物医药等做出的巨大贡献"
            detailModel.avatarStr = "http://hahahahhahahahahahahah.com"
            self.dataSouce.insert(detailModel, at: 0)
        }
        table .reloadData()
        refresh.endRefreshing()
    }

}

