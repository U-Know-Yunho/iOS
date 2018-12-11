//
//  MovieInfoViewController.swift
//  LoginView
//
//  Created by Maru on 29/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit
import Kingfisher

class MovieViewController: UIViewController {
    
    @IBOutlet weak var movieInfoTableView: UITableView!
    
    
    var cellIdentifier: [String] = []
//    var infoData: [MovieDetailInfo] = []
    var moviePk: Int?
    var model: MovieDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieManager.singleton.loadMovieDetail(moviePk!) { movie in
            self.model = movie
            self.movieInfoTableView.reloadData()
            }
        
        // 셀 안의 Item 사이즈에 맞춰서 셀 높이 조절
        movieInfoTableView.rowHeight = UITableView.automaticDimension
        
        registerCell()
//        infoData = creatMovieInfo()
        
    }
    
    
    
    private func registerCell() {
        movieInfoTableView.register(UINib(nibName: "MovieInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieInfoTableViewCell")
        cellIdentifier.append("MovieInfoTableViewCell")
        
        movieInfoTableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoTableViewCell")
        cellIdentifier.append("InfoTableViewCell")
        
        movieInfoTableView.register(UINib(nibName: "CastTableViewCell", bundle: nil), forCellReuseIdentifier: "CastTableViewCell")
        cellIdentifier.append("CastTableViewCell")
        
        movieInfoTableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCell")
        cellIdentifier.append("DescriptionTableViewCell")
        
        movieInfoTableView.register(UINib(nibName: "StillcutTableViewCell", bundle: nil), forCellReuseIdentifier: "StillcutTableViewCell")
        cellIdentifier.append("StillcutTableViewCell")
        
    }
    
    private func creatMovieInfo() -> [MovieDetailInfo] {
        
        var tempMovieInfo: [MovieDetailInfo] = []
        
        let bohemianRhapsody = MovieDetailInfo(director: "브라이언 싱어", actor: "레미 맬렉, 루시 보인턴, 귈림 리, 벤 하디, 조셉 마젤로", genre: "드라마", openDate: "2018.10.31",runningTime: "134분")
        tempMovieInfo.append(bohemianRhapsody)
        
        return tempMovieInfo
    }
}



extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellIdentifier.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieInfoTableViewCell", for: indexPath) as! MovieInfoTableViewCell
            cell.movieTitleLabel.text = model?.title
            //            cell.moviePosterImageView.kf.setImage(with: URL(string: (model?.mainImgUrl)!))
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
//            let data = infoData[indexPath.row - 1]
//            cell.setInfoLabel(movieInfo: data)
            cell.directorLabel.text = model?.director
            
            let num = model?.casts?.count ?? 0
            print("\n------------ [ num ] -------------\n")
            print(num)
            var a: [String] = []
            for i in 0..<num {
                let b = model?.casts?[i].actor ?? ""
                a.append(b)
                print(a)
                let c = a.joined()
                print("\n------------ [ a.joined() ] -------------\n")
                print(c)
                cell.actorLabel.text = c
            }
        
            
            cell.genreLabel.text = model?.genre
            cell.openDateLabel.text = model?.openingDate
            cell.runningTimeLabel.text = model?.durationMin.map({ (String($0) + "분")
            })
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as! CastTableViewCell
            
            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
            // 문자열 중간중간에 있는 '<br>' 제거해주기
            cell.descriptionLabel.text = model?.description?.components(separatedBy: ["<", ">", "b", "r"]).joined()
            cell.descriptionLabel.sizeToFit()
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StillcutTableViewCell", for: indexPath) as! StillcutTableViewCell
            
            return cell
        default:

            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
//            let data = infoData[indexPath.row - 1]
//            cell.setInfoLabel(movieInfo: data)
            return cell
            
        }
    }
    
    
}


