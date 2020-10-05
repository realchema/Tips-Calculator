//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jose M Arguinzzones on 2020-08-19.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    var totalAmount: String?
    var percentageNBR: String = ""
    var splitNBR: String = ""

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var sttingsLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalAmount
        sttingsLabel.text = "Split between \(splitNBR) people, with \(percentageNBR)% tip."

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
    @IBAction func recalculatePressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
}
