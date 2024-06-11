//
//  ViewController.swift
//  plistExample
//
//  Created by E5000846 on 10/06/24.
//

import UIKit

class ViewController: UIViewController {

    var country = [String]()
    var carBrands = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.center = view.center
        view.addSubview(label)
        
        let path =  Bundle.main.path(forResource: "CarDetailList", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path ?? "none")
        country = dict?.object(forKey: "Country") as! [String]
        carBrands = dict?.object(forKey: "carsBrands") as! [String]
        
        print(country)
        print(carBrands)
        print("hello")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ViewController : UITableViewDelegate{
    
}


extension ViewController : UITableViewDataSource{
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: self.view.frame.size.width, height: 20))
        cell.addSubview(label)
        label.text = carBrands[indexPath.row]
        return cell
    }
    
    
}
