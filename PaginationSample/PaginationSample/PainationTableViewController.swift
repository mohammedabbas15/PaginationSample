//
//  PainationTableViewController.swift
//  Pagination
//
//  Created by Field Employee on 10/19/21.
//

import UIKit

struct Games: Codable {
    var title: String
}

class PainationTableViewController: UITableViewController {
    
    @IBOutlet weak var myTableView : UITableView!

    //var dataArray:[Int] = Array()
    var gamesArray:[Games] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentier")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        populateArray(completionHandler: {game in self.gamesArray = game
               DispatchQueue.main.async {
                   self.myTableView.reloadData()
               }
       })
    }
    
    func populateArray(completionHandler: @escaping ([Games])->()) {
        let url = URL(string: "https://www.freetogame.com/api/games")!
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("Error message --- \(error.localizedDescription)")
            }
            do {
                let games = try! JSONDecoder().decode([Games].self, from: data!)
//                self.gamesArray.append(contentsOf: games)
//                print("are we here yet")
//                print(games[0].title)
//                print(self.gamesArray[1].title)
                completionHandler(games)
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // return dataArray.count
        return gamesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentier", for: indexPath)
        //cell.textLabel?.text = "Title: \(dataArray[indexPath.row])"
        cell.textLabel?.text = "Title: \(gamesArray[indexPath.row].title)"

        // Configure the cell...
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
