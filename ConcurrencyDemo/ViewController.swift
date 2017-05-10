//
//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Hossam Ghareeb on 11/15/15.
//  Copyright © 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit

let imageURLs = ["https://wallpaperbrowse.com/media/images/Dubai-Photos-Images-Oicture-Dubai-Landmarks-800x600.jpg", "https://wallpaperbrowse.com/media/images/img_fjords.jpg", "https://wallpaperbrowse.com/media/images/recent-images-11.jpg", "https://wallpaperbrowse.com/media/images/recent-images-11.jpg"]

class Downloader {
    
    class func downloadImageWithURL(_ url:String) -> UIImage! {
        
        let data = try? Data(contentsOf: URL(string: url)!)
        return UIImage(data: data!)
    }
}

public enum NSOperationQueuePriority : Int {
    case veryLow
    case low
    case normal
    case high
    case veryHigh
}



class ViewController: UIViewController {

    var queue = OperationQueue()
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didClickOnStart(_ sender: AnyObject) {
        /*
        let queue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
        queue.async { () -> Void in
            
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            DispatchQueue.main.async(execute: {
                
                self.imageView1.image = img1
            })
            
        }
        queue.async { () -> Void in
            
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView2.image = img2
            })
            
        }
        queue.async { () -> Void in
            
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView3.image = img3
            })
            
        }
        queue.async { () -> Void in
            
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView4.image = img4
            })
        }*/
        /*let serialQueue = DispatchQueue(label: "com.appcoda.imagesQueue", attributes: [])
        
        
        serialQueue.async { () -> Void in
            
            let img1 = Downloader .downloadImageWithURL(imageURLs[0])
            DispatchQueue.main.async(execute: {
                
                self.imageView1.image = img1
            })
            
        }
        serialQueue.async { () -> Void in
            
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView2.image = img2
            })
            
        }
        serialQueue.async { () -> Void in
            
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView3.image = img3
            })
            
        }
        serialQueue.async { () -> Void in
            
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView4.image = img4
            })
        }*/
        /*queue = OperationQueue()
        
        queue.addOperation { () -> Void in
            
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            
            OperationQueue.main.addOperation({
                self.imageView1.image = img1
            })
        }
        
        queue.addOperation { () -> Void in
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            
            OperationQueue.main.addOperation({
                self.imageView2.image = img2
            })
            
        }
        
        queue.addOperation { () -> Void in
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            
            OperationQueue.main.addOperation({
                self.imageView3.image = img3
            })
            
        }
        
        queue.addOperation { () -> Void in
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            
            OperationQueue.main.addOperation({
                self.imageView4.image = img4
            })
            
        }*/
        queue = OperationQueue()
        let operation1 = BlockOperation(block: {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            OperationQueue.main.addOperation({
                self.imageView1.image = img1
            })
        })
        
        operation1.completionBlock = {
            print("Operation 1 completed")
        }
        queue.addOperation(operation1)
        
        let operation2 = BlockOperation(block: {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            OperationQueue.main.addOperation({
                self.imageView2.image = img2
            })
        })
        
        operation2.completionBlock = {
            print("Operation 2 completed")
        }
        queue.addOperation(operation2)
        
        
        let operation3 = BlockOperation(block: {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            OperationQueue.main.addOperation({
                self.imageView3.image = img3
            })
        })
        
        operation3.completionBlock = {
            print("Operation 3 completed")
        }
        queue.addOperation(operation3)
        
        let operation4 = BlockOperation(block: {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            OperationQueue.main.addOperation({
                self.imageView4.image = img4
            })
        })
        
        operation4.completionBlock = {
            print("Operation 4 completed")
        }
        queue.addOperation(operation4)
    }
    
    @IBAction func didClickOnCancel(sender: AnyObject) {
        
        self.queue.cancelAllOperations()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }

}

