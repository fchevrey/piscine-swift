//
//  ViewController.swift
//  d03
//
//  Created by Fabien CHEVREY on 18/11/2020.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        print(imagesUrl.count)
        return imagesUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        print("collection view reload")
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ImgPreviewViewCell
        if (indexPath.item < images.count)
        {
            print("\(indexPath.item)  ok")
            cell.image = images[indexPath.item]
            cell.setupActivity(state: false)
            //let imgView =  cell.imgView
            cell.imgView.isUserInteractionEnabled = true
                let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            cell.imgView.addGestureRecognizer(tapRecognizer)
        }
        else
        {
            
            cell.backgroundColor = .black
            cell.setupActivity(state: true)
            cell.image = UIImage(systemName:"tortoise")
            print("\(indexPath.item)  red")
            //cell.imgView.image = UIImage(
        }
        return cell
    }
    override func prepare(for segue:UIStoryboardSegue, sender:Any?)
    {
        if (segue.identifier == "imageDetail")
        {
            if let dest = segue.destination as? ImageTest
            {
                if let img = sender as? UIImageView
                {
                    dest.imgToDisplay = img.image
                }
            }
        }
        
    }
   /* @IBAction func goToDetail(sender:Any)
    {
        performSegue(withIdentifier: "imageDetail", sender: sender)
    }*/
   
    
    @objc func imageTapped(recognizer: UITapGestureRecognizer)
    {
        print("Image was tapped")
        
        if let theView = recognizer.view as? UIImageView
        {
            performSegue(withIdentifier: "imageDetail", sender: theView)
        }
    }
    
    
    var images:[UIImage] = []
    {
        didSet
        {
            print("you should reload")
            collectionView.reloadData()
        }
    }
    
    var imagesUrl:[String] =
        [
        "https://apod.nasa.gov/apod/image/2011/DoubleCluster_Polanski_4560.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/potw2041a.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/halloween_sun_2014_2k.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/potw2045a.jpg"
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    {
        didSet
        {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    func setupLayout()
    {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:100, height:100)
        collectionView.collectionViewLayout = layout
    }
    
    override func viewDidLoad()
    {
        for str in imagesUrl
        {
            requestImageFrom(urlString: str)
            /*let url = URL(string: str)
            DispatchQueue.global().async
            {
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async
                {
                    self.images.append(UIImage(data: data!)!)
                }
            }*/
        }
        setupLayout()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func requestImageFrom(urlString:String)
    {
        if let url = URL(string:urlString)
        {
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
                        self.images.append(UIImage(data: d)!)
                       // let image = UIImage(data:d)
                }
            }.resume()
        }
    }


}

