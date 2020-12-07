//
//  AdminBD.swift
//  appCartilla
//
//  Created by Andres Estrada on 02/12/20.
//  Copyright © 2020 Andres Estrada. All rights reserved.
//

import Foundation
import SQLite3

class AdminBd{
    let dbPath = "myDB.sqlite"
    var db : OpaquePointer?
    
    
    init(){
        db = openDataBase()
        CreateTable()
        
        
    }
    func openDataBase() -> OpaquePointer?
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
        print("Error al abir la base de datos")
            return nil
        }
        else{
            print("Base de datos Abierta en \(dbPath)")
            return db
        }
    
    }
    
    //funcionalidad para tabla de citas
    //Creaciòn de tabla citas
    func CreateTable(){
        let CreateTable : String = "CREATE TABLE IF NOT EXISTS citas(correoTrab TEXT, idcita Text, curp TEXT,nomPac TEXT,domPac TEXT,descripcion TEXT,fechaPac TEXT, estadocita TEXT)"
        var apuntadorTabla : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, CreateTable, -1, &apuntadorTabla, nil) == SQLITE_OK{      //el & esta mandando como referencia,
            if sqlite3_step(apuntadorTabla) == SQLITE_DONE{
                print("Tabla citas creada")
            }
            else{
                print("No se pudo crear la tabla de citas")
            }
            
        }
        else{
            print("No se pudo preparar Creacion de Tabla")
        }
        sqlite3_finalize(apuntadorTabla)
        
    }
    //Insert de tabla cita.
    func Insert(correoTrab: String, idcita: String, curp: String, nomPac: String, domPac: String, descripcion: String, fechaPac: String, estadocita: String){
        //Este parametro es                                                              1  2  3
        let sentencia : String = "INSERT INTO citas (correoTrab,idcita,curp, nomPac,domPac,descripcion,fechaPac, estadocita) VALUES (?,?,?,?,?,?,?,?)"
        var apuntadorInsert : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, sentencia, -1, &apuntadorInsert, nil) == SQLITE_OK{
            sqlite3_bind_text(apuntadorInsert, 1, (correoTrab as NSString).utf8String, -1, nil)
            sqlite3_bind_text(apuntadorInsert, 2, (idcita as NSString).utf8String, -1, nil)
            sqlite3_bind_text(apuntadorInsert, 3, (curp as NSString).utf8String, -1, nil)
            sqlite3_bind_text(apuntadorInsert, 4, (nomPac as NSString).utf8String, -1, nil)
            sqlite3_bind_text(apuntadorInsert, 5, (domPac as NSString).utf8String, -1, nil)
            sqlite3_bind_text(apuntadorInsert, 6, (descripcion as NSString).utf8String, -1, nil)
            sqlite3_bind_text(apuntadorInsert, 7, (fechaPac as NSString).utf8String, -1, nil)
            sqlite3_bind_text(apuntadorInsert, 8, (estadocita as NSString).utf8String, -1, nil)
            
            if sqlite3_step(apuntadorInsert) == SQLITE_DONE{
                print("Se insertaron las citas")
            }
            else{
                print("Error, no se pudo insertar las citas")
            }
        }
        else{
            print("El insert no se pudo Preparar")
        }
        sqlite3_finalize(apuntadorInsert)
    }
 //------------------Funciòn para actualizar un cita--------------
    //func Update(idProd : Int, nomProd : String, precio : Double){
      //  let sentencia : String = "UPDATE producto SET NomProd = ?, Precio = ? WHERE IdProd = ?"
        //var apuntadorUpdate : OpaquePointer? = nil
        //if sqlite3_prepare_v2(db, sentencia, -1, &apuntadorUpdate, nil) == SQLITE_OK{
          //  sqlite3_bind_text(apuntadorUpdate, 1, (nomProd as NSString).utf8String, -1, nil)
            //sqlite3_bind_double(apuntadorUpdate, 2, Double(precio))
            //sqlite3_bind_int(apuntadorUpdate, 3, Int32(idProd))
            
            //if sqlite3_step(apuntadorUpdate) == SQLITE_DONE{
              //  print("Se Actualizo la cita")
            //}
            //else{
              //  print("El Update no se pudo preparar")
            //}
        //}
        //else{
            //print("El Update no se pudo preparar")
        //}
        //sqlite3_finalize(apuntadorUpdate)
    //}
    
    //----------Funciòn para eliminar un cita-------------------------
    func Eliminar(){
        let sentencia : String = "DELETE FROM citas"
        var apuntadorDelete : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, sentencia, -1, &apuntadorDelete, nil) == SQLITE_OK{
            //sqlite3_bind_int(apuntadorDelete, 1, Int32(idProd))
            
            if sqlite3_step(apuntadorDelete) == SQLITE_DONE{
                print("Se Elimino los registros de citas")
            }
            else{
                print("Los registros de citas no se pudieron eliminar")
            }
        }
        else{
            print("El Delete no se pudo preparar")
        }
        sqlite3_finalize(apuntadorDelete)
        
    }
    
    //
    }

