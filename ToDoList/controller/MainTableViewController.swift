//
//  MainTableViewController.swift
//  ToDoList
//
//  Created by Ademar on 9/17/17.
//  Copyright © 2017 Ademar. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
	
    var repository = NoteRepository()
    var notes = Array<Note>()

    // MARK: - Table view data source
    
    override func viewDidAppear(_ animated: Bool) {
        self.notes = repository.buscar()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
         let indice = indexPath.row
         let note = self.notes[indice]
     
         let celula = tableView.dequeueReusableCell(withIdentifier: "celula",for: indexPath)
        
         celula.textLabel?.text = note.title
         celula.detailTextLabel?.text = note.annotation
        
        if note.check {
            celula.backgroundColor = UIColor.green
        }else{
            celula.backgroundColor = UIColor.red
        }
        
         return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indice = indexPath.row
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let editar = storyBoard.instantiateViewController(withIdentifier: "editar") as! NewNoteViewController
        
        editar.indice = indice
        
        self.present(editar, animated: true, completion: nil)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         let indice = indexPath.row
     
         if editingStyle == .delete {
            
            let refreshAlert = UIAlertController(title: "ALERTA",
                                                 message: "Sua tarefa será deletada permanentemente",
                                                 preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok",
                                                 style: .default,
                                                 handler: { (action: UIAlertAction!) in
                
                self.repository.remover(indice: indice)
                self.notes = self.repository.buscar()
                tableView.reloadData()
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel",
                                                 style: .cancel,
                                                 handler: { (action: UIAlertAction!) in
                print("Cancel action")
            }))
            
            present(refreshAlert, animated: true, completion: nil)
            
         }
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/
    

}
