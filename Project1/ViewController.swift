//
//  ViewController.swift
//  Project1
//
//  Created by Cristofer Silva on 03/02/23.
//

import UIKit

class ViewController: UITableViewController {
    var imagesDatabase = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "My Books"
        navigationItem.title = title
        navigationController?.navigationBar.prefersLargeTitles = true
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let files = try! fm.contentsOfDirectory(atPath: path)
        for item in files where item.hasPrefix("Book"){
            imagesDatabase.append(item)
        }
        imagesDatabase = imagesDatabase.sorted()
        print(dump(imagesDatabase))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesDatabase.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = imagesDatabase[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            detailViewController.selectedImage = ImageToLoad(name: imagesDatabase[indexPath.row], postionInArray: indexPath.row, arraySize: imagesDatabase.count)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
}

