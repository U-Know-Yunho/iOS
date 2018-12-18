//
//  MovieInfoTableViewCell.swift
//  LoginView
//
//  Created by Maru on 29/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit
import UserNotifications

class MovieInfoTableViewCell: UITableViewCell {
    var moviePk: Int?
    var moviePhoto: [String] = []
    var distributionCompany = ["20th_Century_Fox_logo", "20th_Century_Fox_logo", "columbiapictures", "newlinecinema", "paramount", "waltdisney", "showbox"]
    var stillcutURL: [MovieDetail.Stillcut]? {
        didSet {
            self.moviePhotoCollectView.reloadData()
        }
    }
    
    @IBOutlet weak var moviePhotoCollectView: UICollectionView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatedImage: UIImageView!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var customProductCompanyView: UIView!
    @IBOutlet weak var customButtonView: UIView!
    @IBOutlet weak var customMovieNewsButton: UIButton!
    @IBOutlet weak var customMovieInfoButton: UIButton!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var distributionImage: UIImageView!
    
//    @IBAction func alarmButton(_ sender: Any) {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in })
//
//        let content = UNMutableNotificationContent()
//        content.title = "title: 타이틀"
//        content.subtitle = "subtitle: 서브타이틀"
//        content.body = "body: 바디"
//        content.badge = 1
//        content.sound = UNNotificationSound.default
//
//        let date = Date(timeIntervalSinceNow: 2)
//        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//
//        //Adding Request
//        // MARK: - identifier가 다 달라야만 Notification Grouping이 된다
//        let request = UNNotificationRequest(identifier: "\(index)timerdone", content: content, trigger: trigger)
//
//        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//    }
    
    @IBAction func bookButton(_ sender: Any) {
        MainViewController.showCurrentMobvieBookPage(moviePk: moviePk ?? 0)

    }
    
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
        likeImageView.isUserInteractionEnabled = true
        likeImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likeImageTap)))
        movieTitleLabel.sizeToFit()
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        
        distributionImage.image = UIImage(named: distributionCompany.randomElement() ?? "")
//        UNUserNotificationCenter.current().delegate = self
    }
    
    @objc func likeImageTap(_ sender: UITapGestureRecognizer) {
        let greyHeart = UIImage(named: "greyheart")
        let redHeart = UIImage(named: "heart")
        if likeImageView.image == greyHeart {
            likeImageView.image = redHeart
        } else {
            likeImageView.image = greyHeart
        }
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
        return stillcutURL?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePhotoCollectionViewCell", for: indexPath) as! MoviePhotoCollectionViewCell
        if let urlString = stillcutURL?[indexPath.item].imageUrl,
            let url = URL(string: urlString) {
            cell.moviePhotoImageView.kf.setImage(with: url)
        }
        
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

//extension MovieInfoTableViewCell : UNUserNotificationCenterDelegate{
//    //To display notifications when app is running  inforeground
//
//    //앱이 foreground에 있을 때. 즉 앱안에 있어도 push알림을 받게 해준다.
//    //viewDidLoad()에 UNUserNotificationCenter.current().delegate = self를 추가해줄 것.
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        completionHandler([.alert, .sound, .badge])
//    }
//
//    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
//        let settingsViewController = UIViewController()
//        settingsViewController.view.backgroundColor = .gray
//        self.present(settingsViewController, animated: true, completion: nil)
//
//    }

//}



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
