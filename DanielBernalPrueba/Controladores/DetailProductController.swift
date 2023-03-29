//
//  DetailProductController.swift
//  DanielBernalPrueba
//
//  Created by MacBookMBA1 on 28/03/23.
//

import UIKit

class DetailProductController: UIViewController {
    
    @IBOutlet weak var labelTitulo : UILabel!
    @IBOutlet weak var labelDescripcion : UILabel!
    @IBOutlet weak var labelPrecio : UILabel!
    @IBOutlet weak var imageViewProducto : UIImageView!
    @IBOutlet weak var buttonBack : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        SetConfig()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LoadData()
    }
    
    
    @IBAction func buttonBackClic(_ sender : UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    func SetConfig(){
        navigationController?.isNavigationBarHidden = true
        buttonBack.setTitle("Volver", for: .normal)
    }
    
    func SetData(_ producto : Producto){
        labelTitulo.text = producto.title
        labelTitulo.font = UIFont.boldSystemFont(ofSize: 24)
        
        labelDescripcion.text = producto.description
        labelPrecio.text = "Precio \(producto.price)"
        imageViewProducto.downloaded(from: producto.images[0])
    }
    
    func LoadData(){
        if util.idProducto != 0{
            util.productoViewModel.ObtenerProducto(util.idProducto) { producto, error in
                if let producto = producto, error == nil{
                    
                    DispatchQueue.main.async {
                        self.SetData(producto)
                    }
                    
                }else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }else{
            navigationController?.popViewController(animated: true)
        }
    }

}
