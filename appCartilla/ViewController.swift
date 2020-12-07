//
//  ViewController.swift
//  appCartilla
//
//  Created by Andres Estrada on 30/11/20.
//  Copyright © 2020 Andres Estrada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var Inicio = [inicio]()
    var carga = [cargacita]()
        
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtContra: UITextField!
    let jsonclass = JSONClass()
    
    @IBAction func btnInicio(_ sender: UIButton) {
         if txtCorreo.text!.isEmpty || txtContra.text!.isEmpty  {
                   showAlerta(Titulo: "Error", Mensaje: "FALTAN datos en las cajas")
                   txtCorreo.becomeFirstResponder()
                   return
        }
           else {
                 let cor = txtCorreo.text
                 let cont = txtContra.text
                 let datosEnviar = ["correo":cor!, "contrasena":cont!]as NSMutableDictionary
                 jsonclass.arrayFromJson(url: "proyecto/GetRegistro.php", datos_enviados: datosEnviar)
           {
            
                  (array_respuesta) in
                       DispatchQueue.main.async{
                        let arregloDatos = array_respuesta?.object(at: 0) as! NSDictionary
                        if let suc = arregloDatos.object(forKey: "succes") as! String?{
                        if suc == "200"{
                            //self.performSegue(withIdentifier: "segue", sender: self)
                            self.showAlerta(Titulo: "succes", Mensaje: suc)
                            
                    }
                            
                            self.txtCorreo.text = ""
                            self.txtContra.text = ""
                        
                }
                        
                        
                    }
            
                }
            
            }
                        self.performSegue(withIdentifier: "segue", sender: self)
        
        
            }
                    
                    override func viewDidLoad() {
                    super.viewDidLoad()
                        
                     
                    
            }
    
                func showAlerta(Titulo: String, Mensaje: String ){
                   // Crea la alerta
                  let alert = UIAlertController(title: Titulo, message: Mensaje, preferredStyle: UIAlertController.Style.alert)
                  // Agrega un boton
                  alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
                 // Muestra la alerta
                 self.present(alert, animated: true, completion: nil)
                }
                
            }


