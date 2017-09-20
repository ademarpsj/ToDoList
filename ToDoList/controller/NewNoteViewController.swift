//
//  NewNoteViewController.swift
//  ToDoList
//
//  Created by Ademar on 9/17/17.
//  Copyright © 2017 Ademar. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {

    @IBOutlet weak var lbTitle: UITextField!
    @IBOutlet weak var lbAnnotation: UITextField!
    @IBOutlet weak var swDone: UISwitch!
    @IBOutlet weak var lbEstado: UILabel!
    
    var indice: Int = -1
    
    var repositorio = NoteRepository()
    var notes:Note!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //alterar
        if (indice > -1) {
            notes = repositorio.buscarPorIndice(indice: indice)
            
            self.lbTitle.text = notes.title
            self.lbAnnotation.text = notes.annotation
            self.swDone.isOn = notes.check
            
            if swDone.isOn{
                lbEstado.text = "FEITO"
            }
        }
    }
    
    @IBAction func btNew(_ sender: AnyObject) {
        let titulo = self.lbTitle.text!
        let descricao = self.lbAnnotation.text!
        let feito = self.swDone.isOn
        
        var camposObrigatoriosPreenchidos = true
        var msg = ""
        
        if (titulo.isEmpty) {
            msg += "Titulo não foi preenchido "
            camposObrigatoriosPreenchidos = false
        }
        
        if (descricao.isEmpty) {
            msg += "Descricao não foi preenchido "
            camposObrigatoriosPreenchidos = false
        }
        
        if (!camposObrigatoriosPreenchidos) {
            
            //Apresentar mensagem ao usuário
            let alerta = AlertaMensagemUtil.criarAlerta(mensagem: msg)
            self.present(alerta, animated: true, completion: nil)
            return
        }
        
        
        if camposObrigatoriosPreenchidos {
            
                //alterar
            if (indice > -1) {
                notes.title = titulo
                notes.annotation = descricao
                notes.check = feito
                
                repositorio.alterar(indice: indice, note: notes)
                
                //incluir
            }else {
                notes = Note(title: titulo, annotation: descricao, check: feito)
                repositorio.incluir(note: notes)
            }
            
              self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btEstado() {
        
        if swDone.isOn {
            lbEstado.text = "FEITO"
        }else{
            lbEstado.text = "FAZER"
        }
    }
    
}
