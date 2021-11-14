//
//  ViewController.swift
//  PokeDex
//
//  Created by 侯彥廷 on 2021/8/8.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var darkmodebutton: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        
         
        self.button1.layer.cornerRadius = 10
        self.button2.layer.cornerRadius = 10
        
        //darkmodebutton.isEnabled = true
        
        
        
        
            
           
        }
        
}

    



