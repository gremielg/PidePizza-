//
//  SecondViewController.swift
//  Pide Pizza
//
//  Created by admin on 1/29/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var controlAnterior: Bool = false
    @IBOutlet weak var pequenoSwitch: UISwitch!
    @IBOutlet weak var medianoSwitch: UISwitch!
    @IBOutlet weak var grandeSwitch: UISwitch!
    @IBOutlet weak var continuarbuttom1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool){
        disableBoton()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultado =  Tamano()
        let resultado2 = precio()
        //let pantallaProxima2 = false
        let confirmacionVista = segue.destination as! Masa; confirmacionVista.seleccionTamano = resultado as NSArray
        let confirmThird = segue.destination as! Masa;confirmThird.precioTamano1 = resultado2
        //let confirmView2 = segue.destination as! Masa;confirmView2.botonProximo = pantallaProxima2
    }
    @IBAction func pequena(_ sender: Any) {
        valor1Tamano()
        valor1Precio()
        enableBoton()
    }
    func enableBoton()->Bool{
        if pequenoSwitch.isOn || medianoSwitch.isOn || grandeSwitch.isOn {
            continuarbuttom1.isEnabled = true
        }
        return true
    }
    func disableBoton()->Bool{
        if (pequenoSwitch.isOn == false) && (medianoSwitch.isOn == false) && grandeSwitch.isOn == false {
                continuarbuttom1.isEnabled = false
            }
            return true
        }
    
    func valor1Tamano()->String{
            var tamano = "Nada"
        //var tamanoPrecio: [String : Double] = [ :]
            if pequenoSwitch.isOn {
                tamano = "Pequeña"
                grandeSwitch.setOn(false, animated: true)
                medianoSwitch.setOn(false, animated: true)
            }else{
                disableBoton()
            }
        return tamano
        }
    func valor1Precio()->Double{
        var precio = 0.00
        if pequenoSwitch.isOn {
            precio = 6.99
        }
    return precio
    }
    @IBAction func mediana2(_ sender: Any) {
        valor2Tamano()
        valor2Precio()
        enableBoton()
    }
        func valor2Tamano()->String{
            var tamano = "Nada"
        //var tamanoPrecio: [String : Double] = [ :]
            if medianoSwitch.isOn {
                tamano = "Mediana"
                grandeSwitch.setOn(false, animated: true)
                pequenoSwitch.setOn(false, animated: true)
            }else{
                disableBoton()
            }
        return tamano
        }
    func valor2Precio()->Double{
        var precio = 0.00
        if medianoSwitch.isOn {
            precio = 9.99
        }
    return precio
    }
    @IBAction func grande(_ sender: Any) {
        valor3Tamano()
        valor3Precio()
        enableBoton()
    }
        func valor3Tamano()->String{
            var tamano = "Nada"
            if grandeSwitch.isOn {
                tamano = "Grande"
                pequenoSwitch.setOn(false, animated: true)
                medianoSwitch.setOn(false, animated: true)
            }
                else {
                    disableBoton()
                
            }
        return tamano
        }
    func valor3Precio()->Double{
        
        var precio = 0.00
        if grandeSwitch.isOn {
            precio = 12.99
           
        }
    return precio
    }
    @IBOutlet weak var seleccion: UILabel!
    @IBAction func continuarMasa(_ sender: Any) {
        Tamano ()
        precio()
    }
    func Tamano()->[String]{
        let tamano1Pizza = valor1Tamano()
        let tamano2pizza = valor2Tamano()
        let tamano3pizza = valor3Tamano()
        
        var tamanoPizza: [String] = [tamano1Pizza,tamano2pizza,tamano3pizza]
        if tamano1Pizza == "Nada"  && tamano2pizza == "Nada" && tamano3pizza == "Nada" {
            seleccion.text = "Hacer al menos una seleccion"
            print("hacer al menos una ")
        }
        else {
            seleccion.text = " "
        }
        tamanoPizza = tamanoPizza.filter(){$0 != "Nada"}
        return tamanoPizza
        
    }
    func precio()->Double{
        
        let precio1pizza = valor1Precio()
        let precio2pizza = valor2Precio()
        let precio3pizza = valor3Precio()
        
        let precioPizza = precio3pizza + precio2pizza + precio1pizza
        
        return precioPizza
        
    }
}



