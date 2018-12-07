//
//  MovieInfoViewController.swift
//  LoginView
//
//  Created by Maru on 29/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var movieInfoTableView: UITableView!
    
    
    var cellIdentifier: [String] = []
    var infoData: [MovieDetailInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        infoData = creatMovieInfo()
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
            return cell
        case 1:
            let data = infoData[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
            cell.setInfoLabel(movieInfo: data)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as! CastTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StillcutTableViewCell", for: indexPath) as! StillcutTableViewCell
            return cell
        default:
            let data = infoData[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
            cell.setInfoLabel(movieInfo: data)
            return cell
                        
        }
}
    
    
}


