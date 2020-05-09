//
//  Masa.swift
//  Pide Pizza
//
//  Created by admin on 2/6/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class Masa: UIViewController {
    var precioTamano1: Double?
      var seleccionTamano: NSArray?
    
   
    @IBOutlet weak var delgadaSwitch: UISwitch!
    @IBOutlet weak var crujienteSwitch: UISwitch!
    @IBOutlet weak var gruesaSwitch: UISwitch!
    @IBOutlet weak var continuarButtom2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool){
        disableBoton2()
        if seleccionTamano?.count == 0{
            continuarButtom2.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultadoTamano1 =  seleccionTamano
        let resultadoTamano2 = precioTamano1
        let resultadoMasa = Masa()
        let resultadoMasa2 = precioMasa()
        let vistaQueso: Bool = false
        let confirmacionVista = segue.destination as! Queso; confirmacionVista.seleccionTamano = resultadoTamano1!
        let confirmacionVista2 = segue.destination as! Queso;confirmacionVista2.precioTamano1 = resultadoTamano2
        let confirmacionMasa = segue.destination as! Queso; confirmacionMasa.masa = resultadoMasa as NSArray
        let confirmacionPrecioMasa = segue.destination as! Queso;confirmacionPrecioMasa.precioMasa1 = resultadoMasa2
        let proximaVista = segue.destination as! Queso;proximaVista.controlAnterior2 = vistaQueso
    }
    func disableBoton2()->Bool{
    if (delgadaSwitch.isOn == false) && (crujienteSwitch.isOn == false) && gruesaSwitch.isOn == false {
            continuarButtom2.isEnabled = false
        }
        return true
    }
    func enableBoton2()->Bool{
    if delgadaSwitch.isOn || crujienteSwitch.isOn || gruesaSwitch.isOn {
        continuarButtom2.isEnabled = true
    }
    return true
    }
    @IBAction func delgada(_ sender: Any) {
    valorMasa1()
        valorPrecioMasa1()
        enableBoton2()
        }
            func valorMasa1()->String{
                var masa = "Nada"
                if delgadaSwitch.isOn {
                    masa = "Delgada"
                    crujienteSwitch.setOn(false, animated: true)
                    gruesaSwitch.setOn(false, animated: true)
                }else{
                    disableBoton2()
                }
                 return masa
            }
        
   
    func valorPrecioMasa1()->Double{
        var precio = 0.00
        if delgadaSwitch.isOn{
            precio = 0.00
        }
        return precio
    }
    
    @IBAction func crujiente(_ sender: Any) {
    
    
    valorMasa2()
        valorPrecioMasa2()
        enableBoton2()
        }
        func valorMasa2()-> String{
            var masa = "Nada"
            if crujienteSwitch.isOn {
                masa = "Crujiente"
                delgadaSwitch.setOn(false, animated: true)
                gruesaSwitch.setOn(false, animated: true)
            }else{
                disableBoton2()
            }
                return masa
        }
        
    func valorPrecioMasa2()->Double{
        var precio = 0.00
        if crujienteSwitch.isOn{
            precio = 0.15
        }
        return precio
    }
    @IBAction func gruesa(_ sender: Any) {
    
    
            valorMasa3()
        valorPrecioMasa3()
        enableBoton2()
        }
            func valorMasa3()->String{
                var masa = "Nada"
                if gruesaSwitch.isOn {
                    masa = "Gruesa"
                    delgadaSwitch.setOn(false, animated: true)
                    crujienteSwitch.setOn(false, animated: true)
                }else{
                    disableBoton2()
                }
                return masa
            }
    func valorPrecioMasa3()->Double{
        var precio = 0.00
        if gruesaSwitch.isOn{
            precio = 0.20
        }
        return precio
    }
    
    @IBAction func continuarQueso(_ sender: Any) {
        Masa ()
        precioMasa()
        enableBoton2()
    }
    func Masa ()->[String]{
    
    let masa1Pizza = valorMasa1()
            let masa2pizza = valorMasa2()
            let masa3pizza = valorMasa3()
            print (masa3pizza)
            print (masa1Pizza)
            print (masa2pizza)
        var masaPizza = [masa1Pizza,masa2pizza,masa3pizza]
            if masa1Pizza == "Nada" && masa2pizza == "Nada" && masa3pizza == "Nada" {
                //seleccion2.text = "Hacer al menos una seleccion"
                print("hacer al menos una ")
                continuarButtom2.isEnabled = false
                
            }else if seleccionTamano?.count == 0{
                continuarButtom2.isEnabled = false
            }
            else {
                //seleccion2.text = " "
                continuarButtom2.isEnabled = true
                
            }
        masaPizza = masaPizza.filter(){$0 != "Nada"}
        return masaPizza
        }
    func precioMasa()->Double{
        let precioTotalMasa = valorPrecioMasa1() + valorPrecioMasa2() + valorPrecioMasa3()
    
    return precioTotalMasa
        
    }


}
