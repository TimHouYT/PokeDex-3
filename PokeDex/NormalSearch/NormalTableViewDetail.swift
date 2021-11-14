//
//  NormalTableViewDetail.swift
//  PokeDex
//
//  Created by 侯彥廷 on 2021/10/24.
//

import Foundation
import UIKit

class NormalTableViewDetail: UIViewController
{
    
    @IBOutlet weak var name:UILabel!
    
    @IBOutlet weak var image:UIImageView!
    
    @IBOutlet weak var explain: UITextView!
    
    
    
    var selectedPokemon : Pokemon!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        name.text = selectedPokemon.id + " - " + selectedPokemon.name
        image.image = UIImage(named: selectedPokemon.imageName)
        explain.text = selectedPokemon.exp
        
        
    }
}
