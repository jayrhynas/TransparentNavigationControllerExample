//
//  InfoVIewController.swift
//  TransparentNavigationControllerExample
//
//  Created by Jayson Rhynas on 2020-06-26.
//  Copyright © 2020 Jayson Rhynas. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    var item: ModelItem?
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        if let item = self.item {
            self.colorView.backgroundColor = item.color
            self.titleView.text = item.title
            self.descriptionView.text = item.description
        }
    }
}
