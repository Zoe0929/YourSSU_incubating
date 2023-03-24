//
//  MemoListTableViewController.swift
//  YOURSSU_incubating#2
//
//  Created by 지희의 MAC on 2022/05/09.
//

import UIKit

class MemoListTableViewController : UITableViewController, UITextFieldDelegate {
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print(#function)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell){
            if let vc = segue.destination as? DetailViewController{
                vc.memo=MemoList.shared.dummyMemoList[indexPath.row]
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        self.navigationController?.navigationBar.tintColor = .white


        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    // MARK: - Table view data source

    //메모 리스트에 표시될 항목의 개수 전달
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //데이터가 없을 때 메시지 띄우기 (Empty view)
        if MemoList.shared.dummyMemoList.count == 0 {
            self.tableView.setEmptyMessage("메모가 없습니다.")
        } else {
            self.tableView.restore()
        }
        return MemoList.shared.dummyMemoList.count
    }

    //표시될 데이터 전달
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let target = MemoList.shared.dummyMemoList[indexPath.row]
        cell.textLabel?.text=target.title
        cell.detailTextLabel?.text = target.subTitle
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UITableView{
    func setEmptyMessage(_ message: String){
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
           messageLabel.text = message
           messageLabel.textColor = .black
           messageLabel.numberOfLines = 0
           messageLabel.textAlignment = .center
           messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
           messageLabel.sizeToFit()

           self.backgroundView = messageLabel
           self.separatorStyle = .none
    }
    func restore() {
         self.backgroundView = nil
         self.separatorStyle = .singleLine
     }
}
