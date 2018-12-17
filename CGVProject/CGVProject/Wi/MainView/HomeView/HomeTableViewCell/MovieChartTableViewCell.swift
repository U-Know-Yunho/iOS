//
//  MovieChartTableViewCell.swift
//  CGVProject
//
//  Created by Wi on 28/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit
import Alamofire

class MovieChartTableViewCell: UITableViewCell {
    @IBOutlet weak var movieChart: UILabel!
    @IBOutlet weak var dot: UILabel!
    @IBOutlet weak var notReleaseMovie: UILabel!
    
    @IBOutlet weak var standardLabel: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    
    @IBOutlet weak var movieChartCollectionView: UICollectionView!
    var movies: [HomeViewData.Movie]? 
    override func awakeFromNib() {
        super.awakeFromNib()
//         Initialization code
        movieChartCollectionView.dataSource = self
        movieChartCollectionView.delegate = self
        movieChartCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: "MovieChart")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension MovieChartTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let movies = self.movies else {print("MovieList nil"); return 1}
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieChart", for: indexPath) as! MovieCollectionViewCell
        guard let movies = self.movies else {print("MovieList nil"); return cell}
        
        cell.model = MovieCollectionViewCellModel.init((movies[indexPath.row]))
        return cell
        
    }


}

extension MovieChartTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}
