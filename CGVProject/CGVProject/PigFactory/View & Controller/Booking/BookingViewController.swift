
import UIKit

class BookingViewController: UIViewController {

    //예매창 - 영화 타이틀 셀 - 데이터
    var movieTitle = "보헤미안랩소디"
    var movieInfo = "12세이상관람가 = 2시간 14분"
    
    //예매창 - 포스터 콜렉션 셀 - 데이터
    let images = ["001", "002", "003", "004", "005", "006"]

    //예매창 - 날짜 콜렉션 셀 - 데이터
    var movieDay = "월"
    var movieDate = "10"
    
    //예매창 - 영화관 콜렉션 셀 - 데이터
    var theaterTimeTable = "13:00 ~ 15:00"
    var theaterName = "CGV 서울"
    var theaterSeat = "112/255"
    var theaterSection = "12관"

    
    
    
    @IBAction func unwindToBooking(_ unwindSegue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BookingViewController: UITableViewDelegate, UITableViewDataSource {
    
    //첫번째 섹션(0) = title, poster, date
    //두번째 섹션(1) = theater
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return 2
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "BookingTableMovieTitleCell", for: indexPath) as! BookingTableMovieTitleCell
                cell.movieTitle.text = movieTitle
                cell.movieInfo.text = movieInfo
            case 1:
                let _ = tableView.dequeueReusableCell(withIdentifier: "BookingTableViewCell", for: indexPath) as! BookingTableViewCell
            case 2:
                let _ = tableView.dequeueReusableCell(withIdentifier: "BookingDateTableViewCell", for: indexPath) as! BookingDateTableViewCell
            default :
                let table = UITableViewCell()
                return table
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookingTheaterTableViewCell", for: indexPath) as! BookingTheaterTableViewCell
            cell.theaterName.text = theaterName
            cell.theaterSection.text = theaterSection
            
            return cell
        }
        let a = UITableViewCell()
        return a
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                return 45
            case 1:
                return 165
            case 2:
                return 85
            default:
                return 10
            }
        } else {
            return 110
        }
    }
}

extension BookingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    //tag = 0 > 포스터 콜렉션 셀
    //tag = 1 > 날짜 콜렉션 셀
    //tag = 2 > 극장 콜렉션 셀
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return 6
        case 1:
            return 7
        case 2:
            return 5
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingPosterCollectionViewCell", for: indexPath) as! BookingPosterCollectionViewCell
            cell.bookingPosterView.image = UIImage(named: images[indexPath.item])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingDateCollectionViewCell", for: indexPath) as! BookingDateCollectionViewCell
            cell.movieDate.text = movieDate
            cell.movieDay.text = movieDay
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingTheaterCollectionViewCell", for: indexPath) as! BookingTheaterCollectionViewCell
            cell.theaterTimeTable.setTitle(theaterTimeTable, for: .normal)
            cell.theaterSeat.text = theaterSeat
            return cell
        default:
            let a = UICollectionViewCell()
            return a
        }

    }
}
