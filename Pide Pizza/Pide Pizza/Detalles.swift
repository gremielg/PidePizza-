//
//  Detalles.swift
//  Pide Pizza
//
//  Created by admin on 2/14/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class Detalles: UIViewController{
    var seleccionTamano: NSArray = []
    var masa: NSArray = []
    var tipoQueso: NSArray = []
    var ingredientesSeleccionados: NSArray = []
    var precioTamano1: Double = 0.00
    var precioMasa1: Double = 0.00
    var precioTipoQueso: Double = 0.00
    var precioIngredientesSeleccionados: Double = 0.00
    var subtotalCostoPizza: Double = 0.00
    var impuesto: Double = 0.11
    var nombreDeCliente: String = " "
    //labels
    @IBOutlet weak var tamanodetalle: UILabel!
    @IBOutlet weak var masaDetalle: UILabel!
    @IBOutlet weak var quesoDetalle: UILabel!
    @IBOutlet weak var ingredientesDetalle: UILabel!
    @IBOutlet weak var tamPrecioDetalle: UILabel!
    @IBOutlet weak var masPrecioDetalle: UILabel!
    @IBOutlet weak var quePrecioDetalle: UILabel!
    @IBOutlet weak var ingrePrecioDetalle: UILabel!
    @IBOutlet weak var subTotalDetalle: UILabel!
    @IBOutlet weak var impuestoDetalle: UILabel!
    @IBOutlet weak var totalDetalle: UILabel!
    @IBOutlet weak var nombreCliente: UILabel!
    //funciones
    override func viewWillAppear(_ animated: Bool){
         print(seleccionTamano)
         tamanodetalle.text = seleccionTamano.componentsJoined(by: ", ")
         //tamPrecioDetalle.text = String(precioTamano1)
        tamPrecioDetalle.text = numberFormatter.string(for: precioTamano1)
         masaDetalle.text = masa.componentsJoined(by: ", ")
         //masPrecioDetalle.text = String(precioMasa1)
        masPrecioDetalle.text = numberFormatter.string(for: precioMasa1)
         quesoDetalle.text = tipoQueso.componentsJoined(by: ", ")
         //quePrecioDetalle.text = String(precioTipoQueso)
        quePrecioDetalle.text = numberFormatter.string(for: precioTipoQueso)
         ingredientesDetalle.text = ingredientesSeleccionados.componentsJoined(by: ", ")
         //ingrePrecioDetalle.text = String(precioIngredientesSeleccionados)
        ingrePrecioDetalle.text = numberFormatter.string(for: precioIngredientesSeleccionados)
        let subtotal = precioMasa1 + precioTamano1 + precioTipoQueso + precioIngredientesSeleccionados
        
        let impuestoCalculado = subtotal * impuesto
         
        //subTotalDetalle.text = String(subtotal)
        subTotalDetalle.text = numberFormatter.string(for: subtotal)
        impuestoDetalle.text = String(impuestoCalculado)
        
        //totalDetalle.text = String(subtotal + impuestoCalculado)
        totalDetalle.text = numberFormatter.string(for: subtotal + impuestoCalculado)
        nombreCliente.text = nombreDeCliente
    }
     override func viewDidLoad() {
         super.viewDidLoad()

         // Do any additional setup after loading the view.
     }
      lazy var numberFormatter: NumberFormatter = {
           let decimals = NumberFormatter()
           decimals.minimumFractionDigits = 2
           decimals.maximumFractionDigits = 2

           return decimals
         }()
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
     
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
