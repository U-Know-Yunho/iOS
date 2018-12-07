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
    
    let images = ["001", "002", "003", "004", "005", "006"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let a = collectionView.indexPathsForSelectedItems?.first!.row
        guard let destination = segue.destination as? BookingViewController else {return}
        destination.movieTitle = MovieInfo().title[a!]
        destination.ageAndTime = MovieInfo().runningTime
        destination.timeTableInVC = MovieInfo().runningTime
    }
}

extension MoviePosterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePosterCollectionViewCell", for: indexPath) as! MoviePosterCollectionViewCell
        cell.posterView.image = UIImage(named: images[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //이걸 해주면 didselected 다음 prepare가 호출됨
        //self.performSegue(withIdentifier: "posterToBooking", sender: self)
    }
    
}

