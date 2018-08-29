//
//  ResultCard.swift
//  randomdate
//
//  Created by Elif Tultay on 27.08.2018.
//  Copyright © 2018 eliftultay. All rights reserved.
//

import Foundation
import UIKit

class ResultCard : UIViewController {
    
    @IBOutlet weak var annEvent: UILabel!
    @IBOutlet weak var dateEvent: UILabel!
    
    var textEvent : String!
    var textDate : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        annEvent.text = textEvent
        dateEvent.text = textDate
    }
    
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()
    }

    @IBAction func saveToGallery(_ sender: UIButton) {
        
        print("Full Screenshot")
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let fullImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(fullImage!, nil, nil, nil)
        
        print("Partial Screenshot")
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 343, height: 252), false, 0)
        self.view?.drawHierarchy(in: CGRect(origin: CGPoint(x: -15.5, y: -182), size: CGSize(width: 343, height: 252)), afterScreenUpdates: true)
        let ssImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(ssImage, nil, nil , nil)
        
    }
    

    
}
