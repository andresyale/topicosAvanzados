//
//  Inicio.swift
//  appCartilla
//
//  Created by Andres Estrada on 30/11/20.
//  Copyright © 2020 Andres Estrada. All rights reserved.
//

import Foundation
class inicio {
    var corr: String?
    var nomb: String?
    var contra: String?
    var usu: String?
    var fech: String?
    
    init(correo: String?, nomTrab: String?, contrasena: String?, nomPac: String?, fechaPac: String?)
    {
        self.corr = correo
        self.nomb = nomTrab
        self.contra = contrasena
        self.usu = nomPac
        self.fech = fechaPac
    }
}
