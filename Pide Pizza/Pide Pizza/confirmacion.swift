//
//  confirmacion.swift
//  Pide Pizza
//
//  Created by admin on 2/9/20.
//  Copyright © 2020 admin. All rights reserved.
//
import UIKit

class confirmacion: UIViewController, UITextFieldDelegate{
    var seleccionTamano: NSArray = []
    var masa: NSArray = []
    var tipoQueso: NSArray = []
    var ingredientesSeleccionados: NSArray = []
    var precioTamano1: Double = 0.00
    var precioMasa1: Double = 0.00
    var precioTipoQueso: Double = 0.00
    var precioIngredientesSeleccionados: Double = 0.00
    var subtotalCostoPizza: Double = 0.00
    
    //Labels
    @IBOutlet weak var confTamano: UILabel!
    @IBOutlet weak var confMasa: UILabel!
    @IBOutlet weak var confQueso: UILabel!
    @IBOutlet weak var confIngredientes: UILabel!
    @IBOutlet weak var precioMasa: UILabel!
    @IBOutlet weak var precioTamano: UILabel!
    @IBOutlet weak var precioQuesos: UILabel!
    @IBOutlet weak var precioIngredientes: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var entradaNombre: UITextField! // entrar el nombre
    @IBOutlet weak var siButtom: UIButton!
    @IBOutlet weak var noButtom: UIButton!
 
    @IBOutlet weak var visible: UIScrollView!
    
    //funciones
    override func viewWillAppear(_ animated: Bool){
         confTamano.text = seleccionTamano.componentsJoined(by: ", ")
        precioTamano.text = numberFormatter.string(for: precioTamano1)
         confMasa.text = masa.componentsJoined(by: ", ")
        precioMasa.text = numberFormatter.string(for: precioMasa1)
         confQueso.text = tipoQueso.componentsJoined(by: ", ")
        precioQuesos.text = numberFormatter.string(for: precioTipoQueso)
         confIngredientes.text = ingredientesSeleccionados.componentsJoined(by: ", ")
        precioIngredientes.text = numberFormatter.string(for: precioIngredientesSeleccionados)
        total.text = numberFormatter.string(for: precioTamano1 + precioMasa1 + precioTipoQueso + precioIngredientesSeleccionados)
         
    }
     override func viewDidLoad() {
         super.viewDidLoad()
        entradaNombre.delegate = self
        siButtom.isEnabled = false
         // Do any additional setup after loading the view.
     }
    @IBAction func textFieldDidEndEditing(_ textField: UITextField) {
    self.visible.setContentOffset(CGPoint(x:0,y:0), animated: true)
    }
    @IBAction func textFieldDidBeginEditing(textField: UITextField) {
           var punto: CGPoint
           punto = CGPoint(x: 0, y: textField.frame.origin.y-50)
           self.visible.setContentOffset(punto, animated: true)
    }
    @IBAction func backgroundTap ( sender: UIControl){
        entradaNombre.resignFirstResponder()
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if siButtom.isHighlighted{
            print("Boton Si Seleccionado")
            let resultadoQueso1 = tipoQueso
            let resultadoQueso2 = precioTipoQueso
            let resultadoTamano1 =  seleccionTamano
            let resultadoTamano2 = precioTamano1
            let resultadoMasa =  masa
            let resultadoMasa2 = precioMasa1
            let nombre = entrarNombre()
            let resultadoIngredientes = ingredientesSeleccionados
            let resuktadoIngredientes2 = precioIngredientesSeleccionados
            let confirmacionQueso = segue.destination as! Detalles;confirmacionQueso.tipoQueso = resultadoQueso1
            let confirmacionQueso2 = segue.destination as! Detalles;confirmacionQueso2.precioTipoQueso = resultadoQueso2
            let confirmacionVista = segue.destination as! Detalles;confirmacionVista.seleccionTamano = resultadoTamano1
            let confirmacionVista2 = segue.destination as! Detalles;confirmacionVista2.precioTamano1 = resultadoTamano2
            let confirmacionMasa = segue.destination as! Detalles; confirmacionMasa.masa = resultadoMasa
            let confirmacionPrecioMasa = segue.destination as! Detalles;confirmacionPrecioMasa.precioMasa1 = resultadoMasa2
            let confirmacionIngredientes = segue.destination as! Detalles;confirmacionIngredientes.ingredientesSeleccionados = resultadoIngredientes
            let confirmacionPrecioIngredientes = segue.destination as! Detalles;confirmacionPrecioIngredientes.precioIngredientesSeleccionados = resuktadoIngredientes2
            let nombreConfirmacion = segue.destination as! Detalles;nombreConfirmacion.nombreDeCliente = nombre
            }else{
                //print("Boton 'no' Seleccionado, regresa a primera pantalla")
            
        }
        
    }
    func entrarNombre()->String{ /* funcion para entrar el nombre que la persona que hace la orden*/
        let nombreEntrado: String? = self.entradaNombre.text!
        return nombreEntrado!
    
    }
    @IBAction func siConfirmacion(_ sender: Any) {

    }
    //funcion para leer todos los caracteres en un UITextField para activar o desactivar un botón
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let nombreLocal = (entradaNombre.text! as NSString).replacingCharacters(in: range, with: string)
        let tamanoLocal = seleccionTamano
        let kesoLocal = tipoQueso
        let masaLocal = masa
        let ingredientesLocal = ingredientesSeleccionados
        if nombreLocal.isEmpty ||  tamanoLocal.count == 0 || kesoLocal.count == 0 || masaLocal.count == 0 || ingredientesLocal.count == 0 {
     siButtom.isEnabled = false
     siButtom.alpha = 0.5
    } else {
     siButtom.isEnabled = true
     siButtom.alpha = 1.0
    }
     return true
    }
    //para limitar espacios decimales
    lazy var numberFormatter: NumberFormatter = {
      let nf = NumberFormatter()
      nf.minimumFractionDigits = 2
      nf.maximumFractionDigits = 2

      return nf
    }()
}
