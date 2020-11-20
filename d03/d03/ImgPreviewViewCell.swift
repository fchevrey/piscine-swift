//
//  ImgPreviewViewCell.swift
//  d03
//
//  Created by Fabien CHEVREY on 18/11/2020.
//

import UIKit

class ImgPreviewViewCell: UICollectionViewCell
{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var image:UIImage?
    {
        
        didSet
        {
            imgView.image = image
            imgView.layer.cornerRadius = imgView.frame.height / 2
            //imgView.layer.cornerRadius = 50
        }
    }
    //let imgView:UIImageView = UIImageView()
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = imgView.frame.height / 2
        //imgView.clipsToBounds = true
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
