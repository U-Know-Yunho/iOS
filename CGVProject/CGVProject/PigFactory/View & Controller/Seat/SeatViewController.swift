//
//  SeatViewController.swift
//  CGVProject
//
//  Created by PigFactory on 29/11/2018.
//  Copyright © 2018 PigFactory. All rights reserved.
//

import UIKit

class SeatViewController: UIViewController {
    
    @IBOutlet var peopleNumbers: [UIView]!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var lockButton: UIButton!
    @IBOutlet weak var normalCount: UILabel!

    //하단 라벨
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var theaterInfo: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    @IBOutlet weak var aa: UICollectionView!
    
    var normalCounting = 0
    var checkingChooseSeats: [IndexPath] = []
    var reservedSeats: [Int] = []

    //상영관 자세한 정보 받아오기
    var moviePk: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonRoundCorners(item: topButton, cornerRadius: 20)
        viewRoundCorners(item: bottomView, cornerRadius: 20)
        
        //데이터 처리 #2
        //예약된 좌석 정보 불러오기
        var model: SeatModel! {
            didSet {
                reservedSeats.append(model.row)
            }
        }
        print(reservedSeats)
        
        //상영관 정보 받아오기
        guard let moviePk = moviePk else {return}
//        TheaterManager.singleton.loadTheaterDetail(moviePk) { aa in
//            self.theaterDetail = aa
//        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        alert()
    }
    
    func buttonRoundCorners(item: UIButton, cornerRadius: Double) {
        item.layer.cornerRadius = CGFloat(cornerRadius)
        item.clipsToBounds = true
        item.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func viewRoundCorners(item: UIView, cornerRadius: Double) {
        item.layer.cornerRadius = CGFloat(cornerRadius)
        item.clipsToBounds = true
        item.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func alert() {
        let msg = "\n본 영화는 만 12세 이상 관람 가능한 영화입니다. 만 12세 미만 고객은 부모님 또는 만 19세 이상 보호자 동반 시 관람이 가능합니다. 연령 확인 불가 시 입장이 제한 될 수 있습니다.\n"
        let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(OKButton)
        present(alert, animated: true)
    }
    
    @IBAction func handleSelection(_ sender: UIButton) {
//        peopleNumbers.forEach { (view) in
//            UIView.animate(withDuration: 5.0, animations: {
//                view.isHidden = !view.isHidden
//                //예전에는 했는데 지금은 할필요 없는가?
//                //맨 상단 button 위에서 내려오는것 처럼 안보이게 해줌
//                self.view.layoutIfNeeded()
//            })
//        }
        
        peopleNumbers.forEach { (view) in
            UIView.animateKeyframes(
                withDuration: 5.0,
                delay: 0.0,
                animations: {
                    view.isHidden = !view.isHidden
            })
        }
    }
    
    
    //일반인 사람수 선택
    @IBAction func normalCountButton(_ sender: UIStepper) {
        if checkingChooseSeats.count == 0 {
            normalCount.text = String(Int(sender.value))
            normalCounting = Int(sender.value)
        } else {
            normalCount.text = "0"
            normalCounting = 0
            sender.value = 0
            for i in 0..<checkingChooseSeats.count {
                aa.cellForItem(at: checkingChooseSeats[i])?.backgroundColor = .lightGray
            }
            checkingChooseSeats.removeAll()
        }
        
        //인원수가 0일때 lock button view가 뜸
        if normalCounting == 0 {
            lockButton.isHidden = false
        } else {
            lockButton.isHidden = true
        }
    }
    
    //인원수 선택하지 않았을때 떠있는 lock button view
    @IBAction func lockButton(_ sender: UIButton) {
        seatFirstAlert()
    }
    
    //view가 처음 뜰때 바로 뜨는 alert
    func seatFirstAlert() {
        let msg = "인원을 먼저 선택하세요"
        let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(OKButton)
        present(alert, animated: true)
    }
}

extension SeatViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeatCollectionViewCell", for: indexPath) as! SeatCollectionViewCell
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let color = collectionView.cellForItem(at: indexPath)?.backgroundColor
        if normalCounting != 0 {
            if checkingChooseSeats.count < normalCounting {
                if color == .lightGray {
                    // 3자리 동시 예약 적용
                    //                    for i in 0..<normalCounting {
                    //                        checkingChooseSeats.append([indexPath.section, indexPath.item + i])
                    //                        collectionView.cellForItem(at: [indexPath.section, indexPath.item + i])?.backgroundColor = .red
                    //                    }
                    collectionView.cellForItem(at: indexPath)?.backgroundColor = .red
                    checkingChooseSeats.append(indexPath)
                } else {
                    collectionView.cellForItem(at: indexPath)?.backgroundColor = .lightGray
                    checkingChooseSeats.remove(at: checkingChooseSeats.index(of: indexPath)!)
                }
            } else if checkingChooseSeats.count == normalCounting {
                if color == .red {
                    collectionView.cellForItem(at: indexPath)?.backgroundColor = .lightGray
                    checkingChooseSeats.remove(at: checkingChooseSeats.index(of: indexPath)!)
                }
            }
        }
    }
}
