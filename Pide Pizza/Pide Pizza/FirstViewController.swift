//
//  FirstViewController.swift
//  Pide Pizza
//
//  Created by admin on 1/29/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let pantallaProxima =  false
    let confirmSecond = segue.destination as! SecondViewController; confirmSecond.controlAnterior = pantallaProxima
    }
}

