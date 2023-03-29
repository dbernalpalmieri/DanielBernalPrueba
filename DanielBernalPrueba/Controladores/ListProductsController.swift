//
//  ViewController.swift
//  DanielBernalPrueba
//
//  Created by MacBookMBA1 on 28/03/23.
//

import UIKit

class ListProductsController: UIViewController {
    
    var productos : Productos?
    
    @IBOutlet weak var tableViewListaProductos: UITableView!
    @IBOutlet weak var labeltitle : UILabel!

    override func viewWillAppear(_ animated: Bool) {
        LoadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetConfig()
    }
    
    
    
    
    func SetConfig(){
        navigationController?.isNavigationBarHidden = true
        labeltitle.text = "Producto"
        labeltitle.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        tableViewListaProductos.register(ProductoCell.nib, forCellReuseIdentifier: ProductoCell.identifier)
        tableViewListaProductos.delegate = self
        tableViewListaProductos.dataSource = self
    }
    func LoadData(){
        util.productoViewModel.ObtenerProductos { productos, error in
            if let productos = productos, error == nil{
               
                DispatchQueue.main.async {
                    self.productos = productos
                    self.tableViewListaProductos.reloadData()
                }
                
            }else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}
extension ListProductsController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductoCell.identifier) as? ProductoCell, let productos = productos?.products else{
            return UITableViewCell()
        }
        
        cell.labelNombre.text = "Nombre: \(productos[indexPath.row].title)"
        cell.labelPrecio.text = "Precio: \(productos[indexPath.row].price)"
        cell.labelDescripcion.text = productos[indexPath.row].description
        
        
        return cell
    }
    
    
    
    
}
extension ListProductsController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        util.idProducto = productos?.products[indexPath.row].id ?? 0
        performSegue(withIdentifier: "productoDetalle", sender: self)
      
    }
}

