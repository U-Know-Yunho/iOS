//
//  ViewController.swift
//  CGVProject
//
//  Created by PigFactory on 26/11/2018.
//  Copyright © 2018 PigFactory. All rights reserved.
//

import UIKit

class MoviePosterViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //데이터처리 #3 - 영화 정보를 담을 공간을 생성
    var movies: [Movie]?
    
    var selectedCollectionCell: IndexPath = [0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //데이터처리 #4 - 서버로 부터 영화 포스터 정보를 받아와서 변수 movies에 저장해준다.
        //데이터처리 #6 - collectionView에 저장된 데이터를 새로고침 해준다.
        MovieManager.singleton.loadMovieList { movie in
            self.movies = movie
            self.collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let destination = segue.destination as? BookingViewController else { return }
        guard let sendIndexPath = collectionView.indexPathsForSelectedItems else { return }
        destination.selectedCollectionCell = sendIndexPath.first!
    }
    
}

extension MoviePosterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let movies = self.movies else {print("movieList nil"); return 1}
        return movies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePosterCollectionViewCell", for: indexPath) as! MoviePosterCollectionViewCell
        
        //데이터 처리 #5 - guard문을 통해 서버통신을 확인하고, movies에 저장된 영화포스터정보를 차례대로 cell.model에 넣어준다.
        guard let movies = self.movies else {print("movieList nil"); return cell}
        cell.model = MoviePosterCollectionViewCellModel.init(movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCollectionCell = indexPath
    }
}
