//
//  ViewController.swift
//  Landmark
//
//  Created by lucky lukmanul on 05/03/20.
//  Copyright © 2020 lucky lukmanul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNameArray = [String]()
    var landmarkImageArray = [UIImage]()
    
    var choosenLandmarkName = ""
    var choosenLandmarkImge = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup tableview
        tableView.dataSource = self
        tableView.delegate =  self
        
        //setup array
        landmarkNameArray.append("Coloseum")
        landmarkNameArray.append("Great Wall")
        landmarkNameArray.append("Stonenge")
        landmarkNameArray.append("Taj Mahal")
        
        landmarkImageArray.append(UIImage(named: "colosseum.jpg")!)
        landmarkImageArray.append(UIImage(named: "greatewall.jpg")!)
        landmarkImageArray.append(UIImage(named: "stonehenge.pngg")!)
        landmarkImageArray.append(UIImage(named: "tajmahal.jpeg")!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedImage = choosenLandmarkImge
            destinationVC.selectedName = choosenLandmarkName
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNameArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNameArray.remove(at: indexPath.row)
            landmarkImageArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = landmarkNameArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.choosenLandmarkName = landmarkNameArray[indexPath.row]
        self.choosenLandmarkImge = landmarkImageArray[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
}

