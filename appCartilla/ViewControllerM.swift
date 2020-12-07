//
//  ViewControllerM.swift
//  appCartilla
//
//  Created by Andres Estrada on 01/12/20.
//  Copyright © 2020 Andres Estrada. All rights reserved.
//

import UIKit

class ViewControllerM: UIViewController {
     var carga = [cargacita]()
       let jsonclass = JSONClass()
       //Variables
       var db : AdminBd = AdminBd()
       public var info = cargacita(correoTrab: "", idcita: "", curp: "", nomPac: "", domPac: "",descripcion: "", fecha: "", estadocita: "")
    @IBAction func cargaCitas(_ sender: UIButton) {
        
                   self.db.Eliminar()
                    
                    carga.removeAll()
                   let datosEntrada = ["id":""] as NSMutableDictionary
                   jsonclass.arrayFromJson(url: "proyecto/Getcitas.php", datos_enviados: datosEntrada){
                       (array_respuesta) in
                      DispatchQueue.main.async{
                       let NoRegistros = array_respuesta?.count
                       for i in stride(from: 0, to: NoRegistros!, by: 1){
                           let citas = array_respuesta?.object(at: i) as! NSDictionary
                           let cort = citas.object(forKey: "correoTrab")as! String?
                           let idc = citas.object(forKey: "idcita")as! String?
                           let curp = citas.object(forKey: "curp")as! String?
                           let nomp = citas.object(forKey: "nomPac")as! String?
                           let domp = citas.object(forKey: "domPac")as! String?
                           let descrip = citas.object(forKey: "descripcion")as! String?
                           let fecha = citas.object(forKey: "fecha")as! String?
                           let esta = citas.object(forKey: "estadocita")as! String?
                        
                        //sqlite
                        self.db.Insert(correoTrab: cort!, idcita: idc!, curp: curp!, nomPac: nomp!, domPac: domp!, descripcion: descrip!, fechaPac: fecha!, estadocita: esta!)
                        
                       
                        
                        
                        self.carga.append(cargacita(correoTrab: cort, idcita: idc, curp: curp, nomPac: nomp, domPac: domp, descripcion: descrip, fecha: fecha, estadocita: esta))
                        
                        
                       }
                        
                         self.performSegue(withIdentifier: "segue2", sender: self)
                        self.showToast(Titulo: "Guardando", Mensaje: "citas descargadas e insertadas")
                    }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
         override func prepare(for segue: UIStoryboardSegue, sender: Any?){
               if segue.identifier == "segue2" {
                   let CARG = segue.destination as! TableViewController
                   CARG.carga = self.carga
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
    func showToast(Titulo : String, Mensaje : String){
         let alert = UIAlertController(title : Titulo , message: Mensaje, preferredStyle: UIAlertController.Style.alert)
         alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
         
         self.present(alert,animated: true, completion: nil)

    }
    
    
    
    

}
