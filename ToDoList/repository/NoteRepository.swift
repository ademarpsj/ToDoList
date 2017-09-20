//
//  NoteRepository.swift
//  ToDoList
//
//  Created by Ademar on 9/17/17.
//  Copyright © 2017 Ademar. All rights reserved.
//

import Foundation

class NoteRepository{
static var notes = Array<Note>()

func buscar() -> Array<Note> {
    return NoteRepository.notes
}

func buscarPorIndice(indice:Int) -> Note {
    return NoteRepository.notes[indice]
}

//incluir
func incluir(note:Note) -> Void {
    NoteRepository.notes.append(note)
    organizar()
}

//editar
func alterar(indice:Int, note:Note) -> Void {
    NoteRepository.notes[indice] = note
    organizar()
}

//excluir
func remover(indice:Int) -> Void {
    NoteRepository.notes.remove(at: indice)
    }
    
//organizar
func organizar(){
        
    let sortedArray = NoteRepository.notes.sorted
    { a, b in !a.check && b.check }
    
    NoteRepository.notes = sortedArray
    
    }
    
}
