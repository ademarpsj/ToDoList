//
//  AlertaMensagemUtil.swift
//  ToDoList
//
//  Created by Ademar on 9/17/17.
//  Copyright © 2017 Ademar. All rights reserved.
//

import Foundation
import UIKit

class AlertaMensagemUtil {
    
    static func criarAlerta(mensagem:String) -> UIAlertController {
        
        let acaoOK = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        
        let telaDeAlerta = UIAlertController(title: "Aviso",
                                             message: mensagem,
                                             preferredStyle: .alert)
        telaDeAlerta.addAction(acaoOK)
        
        return telaDeAlerta
    }
    
}
