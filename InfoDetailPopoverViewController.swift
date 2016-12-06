//
//  InfoDetailPopoverViewController.swift
//
//  Created by Anatoly Esaulov on 06.12.16.
//  Copyright © 2016 Obanze Dev. All rights reserved.
//

import UIKit

/*: My Really good popoverViewController
It can be used to display some detailed information
It has `titleLabel`, `descriptionTextView` and Close Button
It must be used with `MyPopoverPresentationController` and Segue of type : Modal
In perform method of parentViewController you must
 ```
 dc.modalPresentationStyle = .custom
 dc.transitioningDelegate = self
 dc.data = BeerTypeDetailPopoverViewController.InfoDetailed(infoTitle: "YOUR TITLE", infoDescription: "DESCRIPTION")
 ```
*/
class InfoDetailPopoverViewController: UIViewController {

    // Used to map data
    struct InfoDetailed {
        let infoTitle : String
        let infoDescription : String
    }
    // MARK: - Outlets
    
    @IBOutlet weak var infoDescriptionTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    // MARK: - Constants
    
    var data : InfoDetailed!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        appearanceSetup()
        
        // Mapping Data
        self.titleLabel.text = data.infoTitle
        self.infoDescriptionTextView.text = data.infoDescription
    }
    
    func appearanceSetup() {
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        
        closeButton.clipsToBounds = true
        closeButton.layer.cornerRadius = 5
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // To scroll to top UITextView.
        // TODO: TODO: Better scrolling UITextView to TOP!
        infoDescriptionTextView.setContentOffset(CGPoint.zero, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Events
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
