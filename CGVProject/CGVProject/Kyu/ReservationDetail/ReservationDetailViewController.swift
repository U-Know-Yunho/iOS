//
//  ReservationDetailViewController.swift
//  CGVProject
//
//  Created by Maru on 19/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ReservationDetailViewController: UIViewController {

    var moviePk: Int?
    var book: [TheaterReservation]?
    var screen: ScreeningSet?
    var seat: [SeatsReserved]?
    @IBOutlet weak var reservationDetailView: ReservationDetailCustomView!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TicketManager.singleton.loadUserReservations { book in
            self.book = book
            self.screen = book.first?.screeningSet
            self.seat = book.first?.seatsReserved
        }
        setReservationInfo()
        closeReservationView()
    }
    
    
    func setReservationInfo() {
       
        guard let reservation = self.reservationDetailView else { return }
    reservation.bookMovieTitleLabel.text = self.screen?.title
        reservation.bookMovieTheaterLabel.text = self.screen?.theater
        reservation.bookMovieTimeLabel.text = self.screen?.time
        reservation.bookMovieScreenLabel.text = self.seat?.first?.seatName
    }
    
    func closeReservationView() {
        NotificationCenter.default.addObserver(self, selector: #selector(showMainView), name: Notification.Name("CloseButton"), object: nil)
    }
    @objc func showMainView() {
    MainViewController.showMainViewController()
    }
    
}
    

