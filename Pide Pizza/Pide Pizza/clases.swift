//
//  clases.swift
//  Pide Pizza
//
//  Created by admin on 2/25/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class funciones {

func valor1Tamano()->String{
        var tamano = "Nada"
    //var tamanoPrecio: [String : Double] = [ :]
        if pequenoSwitch.isOn {
            tamano = "Pequeña"
            grandeSwitch.setOn(false, animated: true)
            medianoSwitch.setOn(false, animated: true)
            //tamanoPrecio = [tamano : precio]
        //print(tamano)
           
        }
    return tamano
    }
func valor1Precio()->Double{
    var precio = 0.00
    if pequenoSwitch.isOn {
        precio = 6.99
        grandeSwitch.setOn(false, animated: true)
        medianoSwitch.setOn(false, animated: true)
        precio = 6.99
        //tamanoPrecio = [tamano : precio]
    //print(tamano)
       
    }
return precio
}
 func valor2Tamano()->String{
            var tamano = "Nada"
        //var tamanoPrecio: [String : Double] = [ :]
            if pequenoSwitch.isOn {
                tamano = "Pequeña"
                grandeSwitch.setOn(false, animated: true)
                medianoSwitch.setOn(false, animated: true)
                //tamanoPrecio = [tamano : precio]
            //print(tamano)
               
            }
        return tamano
        }
    func valor2Precio()->Double{
        var precio = 0.00
        if pequenoSwitch.isOn {
            precio = 6.99
            grandeSwitch.setOn(false, animated: true)
            medianoSwitch.setOn(false, animated: true)
            precio = 6.99
            //tamanoPrecio = [tamano : precio]
        //print(tamano)
           
        }
    return precio
    }
    @IBAction func grande(_ sender: Any) {
        valor3Tamano()
        valor3Precio()
    }
        func valor3Tamano()->String{
            var tamano = "Nada"
            
        //var tamanoPrecio: [String : Double] = [ :]
            if pequenoSwitch.isOn {
                tamano = "Pequeña"
                grandeSwitch.setOn(false, animated: true)
                medianoSwitch.setOn(false, animated: true)
                
                //tamanoPrecio = [tamano : precio]
            //print(tamano)
               
            }
        return tamano
        }
    func valor3Precio()->Double{
        var precio = 0.00
        if pequenoSwitch.isOn {
            precio = 6.99
            grandeSwitch.setOn(false, animated: true)
            medianoSwitch.setOn(false, animated: true)
            precio = 6.99
            //tamanoPrecio = [tamano : precio]
        //print(tamano)
           
        }
    return precio
    }
}
