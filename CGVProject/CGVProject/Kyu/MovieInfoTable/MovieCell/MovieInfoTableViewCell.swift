//
//  MovieInfoTableViewCell.swift
//  LoginView
//
//  Created by Maru on 29/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class MovieInfoTableViewCell: UITableViewCell {
    var movieStillCut: [MovieDetail.Stillcut]?
    
    
    var moviePhoto: [String] = ["sample1", "sample2", "sample3", "sample4"]
    @IBOutlet weak var moviePhotoCollectView: UICollectionView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var customProductCompanyView: UIView!
    @IBOutlet weak var customButtonView: UIView!
    @IBOutlet weak var customMovieNewsButton: UIButton!
    @IBOutlet weak var customMovieInfoButton: UIButton!
    
    @IBAction func customMovieNewsButton(_ sender: Any) {
        customMovieNewsButton.layer.addBorder2([.bottom], color: UIColor.red, width: 2.0)
        customMovieInfoButton.layer.addBorder2([.bottom], color: UIColor.white, width: 2.0)
    }
    
    @IBAction func customMovieInfoButton(_ sender: Any) {
        customMovieInfoButton.layer.addBorder2([.bottom], color: UIColor.red, width: 2.0)
        customMovieNewsButton.layer.addBorder2([.bottom], color: UIColor.white, width: 2.0)
        
        

        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        moviePhotoCollectView.dataSource = self
        moviePhotoCollectView.delegate = self
        moviePhotoCollectView.register(UINib(nibName: "MoviePhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MoviePhotoCollectionViewCell")
        
        borderSetting()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func borderSetting() {
        
        // view, button border setting
        customProductCompanyView.layer.addBorder2([.top, .bottom], color: UIColor.lightGray, width: 1.0)
        customButtonView.layer.addBorder2([.bottom], color: UIColor.lightGray, width: 1.0)
    customMovieNewsButton.layer.addBorder2([.bottom], color: UIColor.red, width: 2.0)
    }
    
    
}

extension MovieInfoTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviePhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePhotoCollectionViewCell", for: indexPath) as! MoviePhotoCollectionViewCell
        cell.moviePhotoImageView.image = UIImage(named: moviePhoto[indexPath.row])
        
        return cell
    }
    
    
}
// collectionViewCell은 아이템의 높이를 지정해 주어야 한다.
extension MovieInfoTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return collectionView.bounds.size
    }
}


// 중간 view border line
private extension UIView{
    @IBInspectable var borderWidth2: CGFloat {
        set {
            layer.borderWidth = newValue
        } get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius2: CGFloat {
        set {
            layer.cornerRadius = newValue
        } get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor2: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        } get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
}

// button border line set
private extension UIButton {
    @IBInspectable var buttonBorderWidth2: CGFloat {
        set {
            layer.borderWidth = newValue
            
        } get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var buttonCornerRadius2: CGFloat {
        set {
            layer.cornerRadius = newValue
        } get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var buttonBorderColor2: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        } get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
}


// border 원하는 곳만 설정하는 코드
private extension CALayer {
    func addBorder2(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}
