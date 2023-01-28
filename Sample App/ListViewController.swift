//
//  ListViewController.swift
//  Sample App
//
//  Created by Hritikesh Yadav on 26/01/23.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        // Do any additional setup after loading the view.
    }
    
    func getData(){
        let session = URLSession.shared
        let serviceUrl = URL(string: "https://jsonplaceholder.typicode.com/users")
        
        let task = session.dataTask(with:serviceUrl!) { (serviceData, serviceResponse, error) in
            
            if error == nil{
                let httpResponse = serviceResponse as! HTTPURLResponse
                if(httpResponse.statusCode == 200){
                    // data parse
                    let jsonData = try? JSONSerialization.jsonObject(with: serviceData!, options: .mutableContainers)
                    let result = jsonData as! [Dictionary<String, Any>]
                    for arr in result{
                        print(arr["id"]!)
                    }
                    //                    print("id = \(result["id"]!)")
                }
            }
        }
        task.resume()
    }

}
