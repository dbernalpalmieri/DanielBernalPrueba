
import Foundation

struct ProductoViewModel{
    func ObtenerProductos(_ res : @escaping (Productos? , Error?) -> Void){
        util.urlComponents.scheme = "https"
        util.urlComponents.host = "dummyjson.com"
        util.urlComponents.path = "/products"
        
        if let url = util.urlComponents.url{
            print(url)
            util.urlSession.dataTask(with: url) { data, response, error in
                do{
                    if let data = data, error == nil{
                        let responseData = try util.jsonDecoder.decode(Productos.self, from: data)
                        res(responseData, nil)
                    }
                }catch let error {
                    res(nil, error)
                }
                
            }.resume()
        }
    }
    func ObtenerProducto(_ id : Int, _ res : @escaping (Producto?, Error?) -> Void){
        util.urlComponents.scheme = "https"
        util.urlComponents.host = "dummyjson.com"
        util.urlComponents.path = "/products/\(id)"
        
        if let url = util.urlComponents.url{
            print(url)
            util.urlSession.dataTask(with: url) { data, response, error in
                do{
                    if let data = data, error == nil{
                        let responseData = try util.jsonDecoder.decode(Producto.self, from: data)
                        res(responseData, nil)
                    }
                }catch let error {
                    res(nil, error)
                }
                
            }.resume()
        }
    }
}
