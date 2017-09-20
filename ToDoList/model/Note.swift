import Foundation

class Note {
    
    var title:String
    var annotation:String
    var check:Bool
    
    init(title:String, annotation:String, check:Bool) {
        self.title = title
        self.annotation = annotation
        self.check = check
    }
    
}
