//
//  Queso.swift
//  Pide Pizza
//
//  Created by admin on 2/8/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class Queso: UIViewController{
    var seleccionTamano: NSArray?
    var precioTamano1: Double?
    var masa: NSArray?
    var precioMasa1: Double?
    var controlAnterior2: Bool = false

    @IBOutlet weak var sinQuesoSwitch: UISwitch!
    @IBOutlet weak var mosarellaSwitch: UISwitch!
    @IBOutlet weak var cheddarSwitch: UISwitch!
    @IBOutlet weak var parmesanoSwitch: UISwitch!
    
    
    
    @IBOutlet weak var continuarIngre: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool){
        disableBoton3()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultadoQueso1 = Queso()
        let resultadoQueso2 = precioQueso()
        let resultadoTamano1 =  seleccionTamano
        let resultadoTamano2 = precioTamano1
        let resultadoMasa = masa
        let resultadoMasa2 = precioMasa1
        let vistaIngredientes: Bool = false
        //if seleccionTamano?.count == 0 || masa?.count == 0{
        let confirmacionQueso = segue.destination as! Ingredientes;confirmacionQueso.tipoQueso = resultadoQueso1 as NSArray
        let confirmacionQueso2 = segue.destination as! Ingredientes;confirmacionQueso2.precioTipoQueso = resultadoQueso2
        let confirmacionVista = segue.destination as! Ingredientes; confirmacionVista.seleccionTamano = resultadoTamano1
        let confirmacionVista2 = segue.destination as! Ingredientes;confirmacionVista2.precioTamano1 = resultadoTamano2
        let confirmacionMasa = segue.destination as! Ingredientes; confirmacionMasa.masa = resultadoMasa!
        let confirmacionPrecioMasa = segue.destination as! Ingredientes;confirmacionPrecioMasa.precioMasa1 = resultadoMasa2
        let proximaVista2 = segue.destination as! Ingredientes;proximaVista2.controlAnterior3 = vistaIngredientes
        //}else{
            
        //}
    }
    func disableBoton3()->Bool{
        if (sinQuesoSwitch.isOn == false) && (mosarellaSwitch.isOn == false) && cheddarSwitch.isOn == false && parmesanoSwitch.isOn == false {
            continuarIngre.isEnabled = false
        }
        return true
    }
    func enableBoton3()->Bool{
    if sinQuesoSwitch.isOn || mosarellaSwitch.isOn  || cheddarSwitch.isOn || parmesanoSwitch.isOn {
        continuarIngre.isEnabled = true
    }
        return true
}
    
    @IBAction func sinQueso(_ sender: Any) {
    
    valorQueso1()
        precioValorQueso1()
        enableBoton3()
         }
             func valorQueso1()->String{
                 var queso = "Nada"
                 if sinQuesoSwitch.isOn {
                     queso = "Sin Queso"
                    mosarellaSwitch.setOn(false, animated: true)
                    cheddarSwitch.setOn(false, animated: true)
                    parmesanoSwitch.setOn(false, animated: true)
                    
                 }
                 else {
                    disableBoton3()
                }
                    return queso
             }
    func precioValorQueso1()->Double{
        var precio = 0.00
        if sinQuesoSwitch.isOn{
            precio = 0.00
        }
        return precio
    }
         
    @IBAction func mosarella(_ sender: Any){
        valorQueso2()
        preciovalorQueso2()
        enableBoton3()
        
         }
         func valorQueso2()-> String{
             var queso = "Nada"
             if mosarellaSwitch.isOn {
                 queso = "Mosarella"
                sinQuesoSwitch.setOn(false, animated: true)
             }else{
                disableBoton3()
            }
                 return queso
         }
    func preciovalorQueso2()->Double{
        var precio = 0.00
        if mosarellaSwitch.isOn{
            precio = 0.00
        }
        return precio
    }
     
     
    @IBAction func cheddar(_ sender: Any) {
    
    
             valorQueso3()
        preciovalorQueso3()
        enableBoton3()
        
         }
             func valorQueso3()->String{
                 var queso = "Nada"
                 if cheddarSwitch.isOn {
                     queso = "Cheddar"
                    sinQuesoSwitch.setOn(false, animated: true)
                 }else{
                    disableBoton3()
                }
                 return queso
             }
    func preciovalorQueso3()->Double{
        var precio = 0.00
        if cheddarSwitch.isOn{
            precio = 0.00
        }
        return precio
    }
     
    @IBAction func parmesano(_ sender: Any) {
        valorQueso4()
        preciovalorQueso4()
        enableBoton3()
        }
            func valorQueso4()->String{
                var queso = "Nada"
                if parmesanoSwitch.isOn {
                    queso = "Parmesano"
                    sinQuesoSwitch.setOn(false, animated: true)
                }else{
                    disableBoton3()
                }
                return queso
    }
    func preciovalorQueso4()->Double{
        var precio = 0.00
        if parmesanoSwitch.isOn{
            precio = 0.00
        }
        return precio
    }
    @IBAction func continuarIngredientes(_ sender: Any) {
    Queso()
        precioQueso()
        enableBoton3()
    }
    func Queso()->[String]{
     
     let queso1Pizza = valorQueso1()
             let queso2pizza = valorQueso2()
             let queso3pizza = valorQueso3()
             let queso4pizza = valorQueso4()
        var quesoPizza = [queso1Pizza,queso2pizza,queso3pizza,queso4pizza]
        print (queso3pizza)
             print (queso1Pizza)
             print (queso2pizza)
        print(queso4pizza)
             if queso1Pizza == "Nada" && queso2pizza == "Nada" && queso3pizza == "Nada" && queso4pizza == "Nada" {
                continuarIngre.isEnabled = false
             }
             else {
                continuarIngre.isEnabled = true
             }
        quesoPizza = quesoPizza.filter(){$0 != "Nada"}
        print (quesoPizza)
            return quesoPizza
        }
    func precioQueso()->Double{
        let precioTotal = precioValorQueso1() + preciovalorQueso2() + preciovalorQueso3() + preciovalorQueso4()
        return precioTotal
    }
    
    }
         
     

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


