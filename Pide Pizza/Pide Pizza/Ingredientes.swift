//
//  Ingredientes.swift
//  Pide Pizza
//
//  Created by admin on 2/8/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class Ingredientes: UIViewController {
    var tipoQueso: NSArray?
    var precioTipoQueso: Double?
    var seleccionTamano: NSArray?
    var precioTamano1: Double?
    var masa: NSArray?
    var precioMasa1: Double?
    var controlAnterior3: Bool = false

    @IBOutlet weak var jamonSwitch: UISwitch!
    @IBOutlet weak var pepperoniSwitch: UISwitch!
    @IBOutlet weak var aceitunaSwitch: UISwitch!
    @IBOutlet weak var cebollaSwitch: UISwitch!
    @IBOutlet weak var chorizoSwitch: UISwitch!
    @IBOutlet weak var pavoSwitch: UISwitch!
    @IBOutlet weak var salchichaSwitch: UISwitch!
    @IBOutlet weak var pimientoSwitch: UISwitch!
    @IBOutlet weak var pinaSwitch: UISwitch!
    @IBOutlet weak var archoaSwitch: UISwitch!
    @IBOutlet weak var sinIngredienteSwitch: UISwitch!
    @IBOutlet weak var continuarConf: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool){
        disableBoton4()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultadoQueso1 = tipoQueso
        let resultadoQueso2 = precioTipoQueso
        let resultadoTamano1 =  seleccionTamano
        let resultadoTamano2 = precioTamano1
        let resultadoMasa =  masa
        let resultadoMasa2 = precioMasa1
        let resultadoIngredientes = confirm()
        let resuktadoIngredientes2 = preciosIngredientes()
        //if resultadoMasa!.a != 0 && resultadoQueso1!.count != 0 && resultadoTamano1!.count != 0{
        let confirmacionQueso = segue.destination as! confirmacion;confirmacionQueso.tipoQueso = resultadoQueso1!
        let confirmacionQueso2 = segue.destination as! confirmacion;confirmacionQueso2.precioTipoQueso = resultadoQueso2!
        let confirmacionVista = segue.destination as! confirmacion;confirmacionVista.seleccionTamano = resultadoTamano1!
        let confirmacionVista2 = segue.destination as! confirmacion;confirmacionVista2.precioTamano1 = resultadoTamano2!
        let confirmacionMasa = segue.destination as! confirmacion; confirmacionMasa.masa = resultadoMasa!
        let confirmacionPrecioMasa = segue.destination as! confirmacion;confirmacionPrecioMasa.precioMasa1 = resultadoMasa2!
        let confirmacionIngredientes = segue.destination as! confirmacion;confirmacionIngredientes.ingredientesSeleccionados = resultadoIngredientes as NSArray
        let confirmacionPrecioIngredientes = segue.destination as! confirmacion;confirmacionPrecioIngredientes.precioIngredientesSeleccionados = resuktadoIngredientes2
        //}else{
            //print("hay algo sin completar")
        //}
        //let confirmacionSi = segue.destination as! confirmacion;confirmacionSi.si = botonConfirmacionSi
        //let confirmacionNo = segue.destination as! confirmacion; confirmacionNo.no = botonConfirmacionNo
    }
  func disableBoton4()->Bool{
    if (jamonSwitch.isOn == false) && (pepperoniSwitch.isOn == false) && aceitunaSwitch.isOn == false && cebollaSwitch.isOn == false && chorizoSwitch.isOn == false && pavoSwitch.isOn == false && salchichaSwitch.isOn == false && pimientoSwitch.isOn == false && pinaSwitch.isOn == false && archoaSwitch.isOn == false && sinIngredienteSwitch.isOn == false {
              continuarConf.isEnabled = false
          }
          return true
      }
      func enableBoton4()->Bool{
      if jamonSwitch.isOn || pepperoniSwitch.isOn || aceitunaSwitch.isOn || cebollaSwitch.isOn || chorizoSwitch.isOn || pavoSwitch.isOn || salchichaSwitch.isOn || pimientoSwitch.isOn || pinaSwitch.isOn || archoaSwitch.isOn || sinIngredienteSwitch.isOn {
          continuarConf.isEnabled = true
      }
          return true
  }
    @IBAction func jamon(_ sender: Any) {
        valorJamon()
        precioJamon()
        enableBoton4()
    }
    func valorJamon()->String{
        var ingrediente = "Nada"
                 if jamonSwitch.isOn {
                     ingrediente = "Jamón"
                    sinIngredienteSwitch.setOn(false, animated: true)
                 }else{
                    disableBoton4()
        }
                  return ingrediente
             }
    func precioJamon()->Double{
        var precio = 0.00
        if jamonSwitch.isOn{
            precio = 0.40
        }
        return precio
    }
    @IBAction func pepperoni(_ sender: Any) {
        valorPepperoni()
        precioPepperoni()
        enableBoton4()
    }
    
         func valorPepperoni()-> String{
             var ingrediente = "Nada"
             if pepperoniSwitch.isOn {
                 ingrediente = "Pepperoni"
                sinIngredienteSwitch.setOn(false, animated: true)
             }else{
                disableBoton4()
            }
                 return ingrediente
         }
    func precioPepperoni()->Double{
        var precio = 0.00
        if pepperoniSwitch.isOn{
            precio = 0.40
        }
        return precio
    }
    @IBAction func aceituna(_ sender: Any) {
        valorAceituna()
        precioAceituna()
        enableBoton4()
    }
             func valorAceituna()->String{
                 var ingrediente = "Nada"
                 if aceitunaSwitch.isOn {
                     ingrediente = "Aceituna"
                sinIngredienteSwitch.setOn(false, animated: true)
                 }else{
                    disableBoton4()
                }
                 return ingrediente
             }
    func precioAceituna()->Double{
        var precio = 0.00
        if aceitunaSwitch.isOn{
            precio = 0.40
        }
        return precio
    }
    @IBAction func cebolla(_ sender: Any) {
        valorCebolla()
        precioCebolla()
        enableBoton4()
    }
    
            func valorCebolla()->String{
                var ingrediente = "Nada"
                if cebollaSwitch.isOn {
                    ingrediente = "Cebolla"
                    sinIngredienteSwitch.setOn(false, animated: true)
                }else{
                    disableBoton4()
                }
                return ingrediente
    }
    func precioCebolla()->Double{
        var precio = 0.00
        if cebollaSwitch.isOn{
            precio = 0.40
        }
        return precio
    }
    
    @IBAction func chorizo(_ sender: Any) {
        valorChorizo()
        precioChorizo()
        enableBoton4()
    }
    func valorChorizo() -> String {
        var ingrediente = "Nada"
        if chorizoSwitch.isOn {
            ingrediente = "Chorizo"
            sinIngredienteSwitch.setOn(false, animated: true)
        }else{
            disableBoton4()
        }
        return ingrediente
    }
    func precioChorizo()->Double{
        var precio = 0.00
        if chorizoSwitch.isOn{
            precio = 0.40
        }
        return precio
    }
    
    @IBAction func pavo(_ sender: Any) {
        valorPavo()
        precioPavo()
        enableBoton4()
    }
    func valorPavo()->String{
        var ingrediente = "Nada"
        if pavoSwitch.isOn {
            ingrediente = "Pavo"
            sinIngredienteSwitch.setOn(false, animated: true)
        }else{
            disableBoton4()
        }
        return ingrediente
    }
    func precioPavo()->Double{
        var precio = 0.00
        if pavoSwitch.isOn{
            precio = 0.40
        }
        return precio
    }
    @IBAction func salchicha(_ sender: Any) {
        valorSalchicha()
        precioSalchicha()
        enableBoton4()
    }
    func valorSalchicha()->String{
        var ingrediente = "Nada"
        if salchichaSwitch.isOn {
            ingrediente = "Salchicha"
            sinIngredienteSwitch.setOn(false, animated: true)
        }else{
            disableBoton4()
        }
        return ingrediente
    }
    func precioSalchicha()->Double{
        var precio = 0.00
        if salchichaSwitch.isOn{
            precio = 0.40
        }
        return precio
    }
    
    @IBAction func pimiento(_ sender: Any) {
        valorPimiento()
        precioPimiento()
        enableBoton4()
    }
    func valorPimiento()->String{
        var ingrediente = "Nada"
        if pimientoSwitch.isOn {
            ingrediente = "Pimiento"
            sinIngredienteSwitch.setOn(false, animated: true)
        }else{
            disableBoton4()
        }
        return ingrediente
    }
    func precioPimiento()->Double{
        var precio = 0.00
        if pimientoSwitch.isOn{
            precio = 0.40
        }
        return precio
    }
    @IBAction func pina(_ sender: Any) {
        valorPina()
        precioPina()
        enableBoton4()
    }
    func valorPina()->String{
        var ingrediente = "Nada"
        if pinaSwitch.isOn {
            ingrediente = "Piña"
            sinIngredienteSwitch.setOn(false, animated: true)
        }else{
            disableBoton4()
        }
        return ingrediente
    }
    func precioPina()->Double{
        var precio = 0.00
        if pinaSwitch.isOn{
            precio = 0.40
        }
        return precio
    }
    @IBAction func archoa(_ sender: Any) {
        valorArchoa()
        precioArchoa()
        enableBoton4()
    }
    func valorArchoa()->String{
        var ingrediente = "Nada"
        if archoaSwitch.isOn {
            ingrediente = "Archoa"
            sinIngredienteSwitch.setOn(false, animated: true)
        }else{
            disableBoton4()
        }
        return ingrediente
    }
    func precioArchoa()->Double{
        var precio = 0.00
        if archoaSwitch.isOn{
            precio = 0.40
        }
        return precio
    }
    @IBAction func sinIngredientes(_ sender: Any) {
        valorSinIngredientes()
        precioSinIngredientes()
        enableBoton4()
    }
    func valorSinIngredientes()->String{
        var ingrediente = "Nada"
        if sinIngredienteSwitch.isOn {
            ingrediente = "Sin Ingredientes"
            archoaSwitch.setOn(false, animated: true)
            pepperoniSwitch.setOn(false, animated: true)
            pinaSwitch.setOn(false, animated: true)
            jamonSwitch.setOn(false, animated: true)
            aceitunaSwitch.setOn(false, animated: true)
            cebollaSwitch.setOn(false, animated: true)
           pavoSwitch.setOn(false, animated: true)
            chorizoSwitch.setOn(false, animated: true)
            pimientoSwitch.setOn(false, animated: true)
            salchichaSwitch.setOn(false, animated: true)
        }else{
            disableBoton4()
        }
        return ingrediente
    }
    func precioSinIngredientes()->Double{
        var precio = 0.00
        if sinIngredienteSwitch.isOn{
            precio = 0.00
        }
        return precio
    }
    
    func preciosIngredientes()->Double{
    
        let precioIngredientes: Double = precioJamon() + precioPepperoni() + precioAceituna() + precioCebolla() + precioChorizo() + precioPavo() + precioSalchicha() + precioPimiento() + precioPina() + precioArchoa() + precioSinIngredientes()
        print (precioIngredientes)
        return precioIngredientes
    }

    @IBAction func continuarConfirmacion(_ sender: Any) {
        confirm ()
        preciosIngredientes()
        enableBoton4()
    }
    func confirm ()->[String]{
        let ingrediente1Pizza = valorJamon()
             let ingrediente2Pizza = valorPepperoni()
             let ingrediente3Pizza = valorAceituna()
             let ingrediente4Pizza = valorCebolla()
        let ingrediente5Pizza = valorChorizo()
        let ingrediente6Pizza = valorPavo()
        let ingrediente7Pizza = valorSalchicha()
        let ingrediente8Pizza = valorPimiento()
        let ingrediente9Pizza = valorPina()
        let ingrediente10Pizza = valorArchoa()
        let ingrediente11Pizza = valorSinIngredientes()
        var ingredientesPizza = [ingrediente1Pizza,ingrediente2Pizza,ingrediente3Pizza,ingrediente4Pizza,ingrediente5Pizza,ingrediente6Pizza,ingrediente7Pizza,ingrediente8Pizza,ingrediente9Pizza,ingrediente10Pizza,ingrediente11Pizza]
             if ingrediente1Pizza == "Nada" && ingrediente2Pizza == "Nada" && ingrediente3Pizza == "Nada" && ingrediente4Pizza == "Nada" && ingrediente5Pizza == "Nada" && ingrediente6Pizza == "Nada" && ingrediente7Pizza == "Nada" && ingrediente8Pizza == "Nada" && ingrediente9Pizza == "Nada" && ingrediente10Pizza == "Nada" && ingrediente11Pizza == "Nada"{
                 print("hacer al menos una ")
             }
             else {
                
            
             }
        ingredientesPizza = ingredientesPizza.filter(){$0 != "Nada"}
        print (ingredientesPizza)
        return ingredientesPizza
        
         }
         
     }
