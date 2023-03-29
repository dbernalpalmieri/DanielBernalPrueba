import Foundation


struct Productos : Codable{
    let products : [Producto]
    
    let total : Int
    let skip : Int
    let limit : Int
}

struct Producto : Codable{
    let id : Int
    let title : String
    let description: String
    let price : Double
    let images : [String]
}
