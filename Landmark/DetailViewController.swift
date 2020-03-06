//
//  DetailViewController.swift
//  Landmark
//
//  Created by lucky lukmanul on 06/03/20.
//  Copyright © 2020 lucky lukmanul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var selectedImage = UIImage()
    var selectedName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = selectedImage
        nameLbl.text = selectedName
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
