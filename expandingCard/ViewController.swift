//
//  ViewController.swift
//  expandingCard
//
//  Created by Brandon Wood on 8/16/19.
//  Copyright © 2019 Brandon Wood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var bottomCard: UIView!
    @IBOutlet weak var bottomCardHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bottomCardLabel: UILabel!
    @IBOutlet weak var bottomCardLabelTopConstraint: NSLayoutConstraint!
    
    var bottomCardCollapsed : Bool = true
    
    let btmLabelCollapsedConstraintNum : CGFloat = -10
    let btmLabelOpenConstraintNum : CGFloat = 100
    
    let btmCardCollapsedHeight : CGFloat = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomCardHeightConstraint.constant = btmCardCollapsedHeight
        self.bottomCardLabel.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
        self.bottomCardLabelTopConstraint.constant = btmLabelCollapsedConstraintNum
    }
    


    @IBAction func menuButtonPressed(_ sender: Any) {
        
        if (bottomCardCollapsed) {
            UIView.animate(withDuration: 0.3, animations: {
                self.bottomCardHeightConstraint.constant = 300
                self.titleLabel.transform  = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.bottomCardLabel.transform = .identity
                self.bottomCardLabelTopConstraint.constant = self.btmLabelOpenConstraintNum

                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.bottomCardHeightConstraint.constant = self.btmCardCollapsedHeight
                self.titleLabel.transform  = .identity
                self.bottomCardLabel.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                self.bottomCardLabelTopConstraint.constant = self.btmLabelCollapsedConstraintNum
                self.view.layoutIfNeeded()
            })
        }
        
        bottomCardCollapsed = !bottomCardCollapsed
    }
    
    
    
    
}

