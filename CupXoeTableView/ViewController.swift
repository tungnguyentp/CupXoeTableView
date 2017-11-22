//
//  ViewController.swift
//  CupXoeTableView
//
//  Created by Tung Nguyen on 11/15/17.
//  Copyright © 2017 Tung Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewEx: UITableView!
    
    var sectionArray = [Section(name: "1",expan: true),Section(name: "2",expan: false),Section(name: "3",expan: false),Section(name: "4",expan: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableViewEx.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableViewEx.delegate = self
        tableViewEx.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .red
        let tapRecognizer = MyTapGesture(target: self, action: #selector(handleTap))
        tapRecognizer.title = section
        v.addGestureRecognizer(tapRecognizer)
        
        
                let lable = UILabel()
                lable.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30)
                v.addSubview(lable)
                lable.text = sectionArray[section].name
                lable.textColor = UIColor.white
        
        return v
    }
    
    @objc func handleTap(gestureRecognizer: MyTapGesture){

        sectionArray[gestureRecognizer.title].expan = !sectionArray[gestureRecognizer.title].expan
    
        tableViewEx.beginUpdates()
        for i in 0..<sectionArray[gestureRecognizer.title].name.count{
            tableViewEx.rectForRow(at: IndexPath(row: i, section: gestureRecognizer.title))
        }
        tableViewEx.endUpdates()
        
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .black

        return view
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sectionArray[indexPath.section].expan{
            return 44
        }else{
            return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewEx.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Tung"
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }

}

class MyTapGesture: UITapGestureRecognizer {
    var title = Int()
}

