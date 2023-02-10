//
//  DetailViewController.swift
//  Project1
//
//  Created by Cristofer Silva on 04/02/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: ImageToLoad?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad.name)
            title = "Picture \(imageToLoad.postionInArray + 1) of \(imageToLoad.arraySize)"
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("Image not found!")
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: [image, selectedImage?.name], applicationActivities: [])
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityViewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

struct ImageToLoad {
    let name: String
    let postionInArray: Int
    let arraySize: Int
}
