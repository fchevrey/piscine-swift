//
//  ViewController.swift
//  d02
//
//  Created by Fabien CHEVREY on 13/11/2020.
//
//pouer

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var dataArray:[(name:String, date:String, how:String)] = [
        ("the colonel", "febr 11 2020", "heart attack"),
        ("the majordome", "janu 22 2021", "slip"),
        ("lola bunny", "march 03 2022", "cartoon piano accident")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    @IBAction func unWindSegue(segue: UIStoryboardSegue)
    {
        print(segue.identifier)
    }
    
    func AddField(name:String, date:String, how:String)
    {
        dataArray += [(name:name, date:date, how:how)]
        print(dataArray.last)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! deathCustomCell
        cell.data = dataArray[indexPath.row]
        //cell?.textLabel?.text = dataArray[indexPath.row].0
        //cell?.detailTextLabel?.text = dataArray[indexPath.row].1
        return cell
        //cell?.detailTextLabel?.text = dataArray[in]
    }
    

    
    @IBOutlet weak var tableView: UITableView!
    {
        didSet
        {
            //we can do the following lines beacause ViewController inherit from UITableView DataSource etc
            
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

