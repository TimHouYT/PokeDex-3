//
//  SkillTableViewDetail.swift
//  PokeDex
//
//  Created by 戴育宸 on 2021/10/27.
//

import Foundation
import UIKit

class SkillTableViewDetail: UIViewController{
    
   
   
    @IBOutlet weak var skillname: UILabel!
    
    @IBOutlet weak var skillexplain: UITextView!
    
    
    var selectedSkill : Skill!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        skillname.text = selectedSkill
            .skid + " - " + selectedSkill.skname
        
        skillexplain.text = selectedSkill.skexp
                
    }
    
}

    


