
import UIKit

class BookingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //이 화면으로 넘어왔을때 선택된 포스터를 클릭후 다음 포스터를 눌렀을때 스크롤이 돌아가는것을 방지하기 위한 용도
    var firstScrollEnable = true
    
    //예매창 - 날짜 콜렉션 셀 - 데이터
    var movieDay = "월"
    var movieDate = "10"
    var movieDateDetails = "2018년 12월 10일 월요일-오늘"
    
    //예매창 - 영화관 콜렉션 셀 - 데이터
    var theaterTimeTable = ["13:00 ~ 15:00", "00:00 ~ 1:00"]
    var theaterName = "CGV 서울"
    var theaterSeat = "112/255"
    var theaterSection = "12관"

    //데이터처리 #3 - 영화 정보를 담을 공간을 생성
    var movies: [HomeViewData.Movie]?
    var movieDetails: MovieDetail?
    var theater: [Theater]?
    var theaterDetail: TheaterDetail?
    var moviePk: Int?
    
    var a = true
    
    @IBAction func unwindToBooking(_ unwindSegue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("----------------[1. view did load] ---------------")
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
        print(moviePk)
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
        //영화 정보 받아오기
        MovieManager.singleton.loadHomeViewData(nowOpen: true) { (homeViewData) in
            self.movies = homeViewData.chart
            self.tableView.reloadData()
        }
        
        //처음 영화 상세 정보 받아오기
        guard let moviePk = moviePk else {return}
        MovieManager.singleton.loadMovieDetail(moviePk) { MovieDetails in
            self.movieDetails = MovieDetails
            self.tableView.reloadRows(at: [[0,0]], with: UITableView.RowAnimation.fade)
        }
        
        //상영관 정보 받아오기
        TheaterManager.singleton.loadTheaterList{ Theater in
            self.theater = Theater
            self.tableView.reloadData()
        }
        
        //상영관 상세 정보 받아오기
        TheaterManager.singleton.loadTheaterDetail(moviePk) { TheaterDetails in
            self.theaterDetail = TheaterDetails
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("----------------[2. view did appear] ---------------")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        firstScrollEnable = true
    }
    
    /*
     static func showSeatPage(moviePk: Int){
     let bookStoryboard = UIStoryboard(name: "Book", bundle: nil)
     guard let seatVC = bookStoryboard.instantiateViewController(withIdentifier: "Seat") as? SeatViewController  else {
     return print("Bookstoryborad faild")
     }
     seatVC.moviePk = moviePk
     print("지금 누른 영화의 pk: ", moviePk)
     UIApplication.shared.delegate?.window!!.rootViewController?.show(seatVC, sender: nil)
     }
     */
    
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
            return 3
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
                
                //메인 화면에서 영화 클릭해서 들어왔을 때 바로 해당 타이틀 보여주기용
                //movie title 데이터 #5 - moive title, duration 넣어주기
                //collection cell을 선택할때도 다시 여기로 들어와진다
                guard let movieDetail = self.movieDetails else {print("movieDetail nil"); return cell}
                cell.model = MovieTitleModel.init(movieDetail)
                return cell

            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "BookingTableViewCell", for: indexPath) as! BookingTableViewCell
                cell.moviePk = moviePk
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "BookingDateTableViewCell", for: indexPath) as! BookingDateTableViewCell
                cell.movieDateDetails.text = movieDateDetails
                return cell
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
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        //print("----------------[3. will display] ---------------")
//
//        if indexPath.section == 0 {
//            switch indexPath.row {
//            case 1:
//                //print("kkkkk")
//                (cell as? BookingTableViewCell)?.posterCollectionView.reloadData()
//            default:
//                break
//            }
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                return 45
            case 1:
                return 190
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
    
//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    //tag = 0 > 포스터 콜렉션 셀
    //tag = 1 > 날짜 콜렉션 셀
    //tag = 2 > 극장 콜렉션 셀
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            guard let movies = self.movies else { return 1 }
            return movies.count
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
        
        //포스터 콜랙션
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingPosterCollectionViewCell", for: indexPath) as! BookingPosterCollectionViewCell

            //데이터 처리 #5 - guard문을 통해 서버통신을 확인하고, movies에 저장된 영화포스터정보를 차례대로 cell.model에 넣어준다.
            guard let movies = movies else { print("movieList nil"); return cell }
            cell.model = MoviePosterCollectionViewCellModel.init(movies[indexPath.row])
            

            //print(movies.index(of: moviePk))
            if firstScrollEnable == true {
                for i in 0...20 {
                    if movies[i].pk == moviePk {
                        collectionView.selectItem(at: [0, i], animated: true, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
                        firstScrollEnable = false
                    }
                }
            }
            
            return cell
        
        //예약 가능 날짜
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingDateCollectionViewCell", for: indexPath) as! BookingDateCollectionViewCell
            guard let movieDate = movies else {print("movieDate nil"); return cell }
//            cell.model = BookingDateModel.init(movieDate[indexPath.row])
            
            return cell
            
        //상영시간 및 예약 가능 자석 표시
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingTheaterCollectionViewCell", for: indexPath) as! BookingTheaterCollectionViewCell
            cell.theaterTimeTable.setTitle(theaterTimeTable[0], for: .normal)
            cell.theaterSeat.text = theaterSeat
            return cell
        default:
            let a = UICollectionViewCell()
            return a
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //print("----------------[4. collection View will display ] ---------------")
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            
            //누를때마다 영화 상세 정보 받아오기
            //1. 정보를 불러온다 > 2. { } 외부먼저 진행 > 3. { } 내부 진행
            MovieManager.singleton.loadMovieDetail(movies![indexPath.row].pk) { detail in
                self.movieDetails = detail
                self.tableView.reloadRows(at: [[0, 0]], with: UITableView.RowAnimation.fade)
            }

            collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            
            theaterTimeTable.reverse()
            tableView.reloadSections([1, 1], with: UITableView.RowAnimation.fade)
            
        default:
            print(0)
        }
    }

}
