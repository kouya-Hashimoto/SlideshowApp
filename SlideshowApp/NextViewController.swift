//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 橋本晃矢 on 2021/04/13.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var segueimage: UIImageView!
    
    var images:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segueimage.image = images
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
