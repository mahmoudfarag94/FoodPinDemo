import Foundation

class RestauranteModel {
    
    var name:String?
    var location:String?
    var type:String?
    var image:String?
    var phone:String?
    var rating = ""
    var isVisited:Bool = false
    
    init(name:String , type:String , location:String,phone:String, image:String , isVisited:Bool) {
        self.name = name
        self.location = location
        self.type = type
        self.image = image
        self.phone = phone
        self.isVisited = isVisited
    }
    
}
