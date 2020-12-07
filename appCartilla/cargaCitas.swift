//
//  cargaCitas.swift
//  appCartilla
//
//  Created by Andres Estrada on 01/12/20.
//  Copyright © 2020 Andres Estrada. All rights reserved.
//

import Foundation
class cargacita {
    var corrt: String?
    var idcita: String?
    var curp: String?
    var nomp: String?
    var domp: String?
    var descrip: String?
    var fechap: String?
    var esta: String?
    
    init(correoTrab: String?, idcita: String?, curp: String?, nomPac: String?, domPac: String?,descripcion:String?, fecha: String?, estadocita: String?)
    {
        self.corrt = correoTrab
        self.idcita = idcita
        self.curp = curp
        self.nomp = nomPac
        self.domp = domPac
        self.descrip = descripcion
        self.fechap = fecha
        self.esta = estadocita
    }
}
