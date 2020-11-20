//
//  ImageTest.swift
//  d03
//
//  Created by Fabien CHEVREY on 19/11/2020.
//

import UIKit

class ImageTest : UIViewController
{
    @IBOutlet weak public var image: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad()
    {
        if let img = imgToDisplay
        {
            image.image = img
        }
        else
        {
            image.backgroundColor = .red
        }
        
        
        //requestImageFrom(urlString: "https://apod.nasa.gov/apod/image/2011/DoubleCluster_Polanski_4560.jpg")
        super.viewDidLoad()
        //setupActivity(state:true)
        // Do any additional setup after loading the view.
    }
    var  imgToDisplay:UIImage?
    
    func requestImageFrom(urlString:String)
    {
        if let url = URL(string:urlString)
        {
            print("im here")
            URLSession.shared.dataTask(with: url)
            {
                (data, response, error) in
                DispatchQueue.main.async()
                {
                    print("coucou")
                    if let er = error
                    {
                        print(er)
                    }
                    guard let d = data else
                    {
                        return
                        
                       // let image = UIImage(data:d)
                    }
                    print("pouet")
                    print (d)
                    self.image.image = UIImage(data: d)
                    self.setupActivity(state: false)

                }
            }.resume()
        }
    }
    func setupActivity(state:Bool)
    {
        activityIndicator.isHidden = !state
        if (state)
        {
            activityIndicator.startAnimating()
        }
        else
        {
            activityIndicator.stopAnimating()
        }
    }
}
