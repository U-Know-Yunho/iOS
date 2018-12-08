
import UIKit

class BookingViewController: UIViewController {

    var movieTitle = ""
    var ageAndTime = ""
    var timeTableInVC = ""
    
    @IBAction func unwindToBooking(_ unwindSegue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BookingViewController: UITableViewDelegate, UITableViewDataSource {
    
    
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
                cell.titleLabel.text = movieTitle
                cell.ageInfoAndRuningTime.text = ageAndTime
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
            cell.timeTable = timeTableInVC
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
