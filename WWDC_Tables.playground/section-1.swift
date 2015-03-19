// Playground - noun: a place where people can play

import UIKit

var str = "Hello world"

class DataSource: NSObject, UITableViewDataSource
{
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int { return 4 }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let row = indexPath.row
        
        let style = UITableViewCellStyle.fromRaw(row)
        
        let cell = UITableViewCell(style: style ? style! : .Default, reuseIdentifier: nil)
        cell.textLabel.text = "Text"
        
        if let detailTextLabel = cell.detailTextLabel
        {
            detailTextLabel.text = "Detail Text"
        }
        
        return cell
    }
}

let ds = DataSource()
let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 240), style: .Plain)

tableView.dataSource = ds
tableView.reloadData()
