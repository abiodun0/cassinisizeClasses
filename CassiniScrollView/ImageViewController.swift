//
//  ImageViewController.swift
//  CassiniScrollView
//
//  Created by Abiodun Shuaib on 22/04/2016.
//  Copyright © 2016 Abiodun Shuaib. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    var imageURL: NSURL?{
        didSet{
           image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    private func fetchImage(){
        if let url = imageURL{
            spinner?.startAnimating()
            let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
            dispatch_async(dispatch_get_global_queue(qos, 0), { 
                let imageData = NSData(contentsOfURL: url)

            dispatch_async(dispatch_get_main_queue(), { 
                if imageData != nil{
                    self.image = UIImage(data: imageData!)
                    
                }
                else{
                    self.image = nil
                }
                
            })
        })
                    }
    }
    private var imageView = UIImageView()
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        print(view.window)
//        if image == nil {
//            print("get something")
//            imageURL = DemoUrl.standford
//        }
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear \(view.window)")
        if image == nil {
            fetchImage()
        }
    }
}
