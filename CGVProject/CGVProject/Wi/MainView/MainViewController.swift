//
//  HomeViewController.swift
//  CGVProject
//
//  Created by Wi on 26/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    // MARK: Sington
    static let singleton = MainViewController()
    
    // MARK: MainView Instance
    let mainView = MainView()
    
    
    // MARK: SideMenu Instance
    let sideMenu = SideMenu()
    let sideMenuWidth: CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        let leftNaviButton = UIBarButtonItem(image: UIImage(named: "cgvLogo"), style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.contentMode = .left
        self.navigationItem.leftBarButtonItem = leftNaviButton
        let rightNaviButton = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(showSideMenu))
        self.navigationItem.rightBarButtonItem = rightNaviButton
        
    }
    var isSidemenuOpen = false
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @objc private func closeSideMenu(){
        print("tapView")
        if isSidemenuOpen {
            sideMenuTrailingConstraints?.constant = sideMenuWidth
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
        }
    }
    @objc private func showSideMenu(){
        print("sideMenuBtnTap")
        sideMenu.tableView.reloadData()
        if sideMenuTrailingConstraints?.constant == 0{
            isSidemenuOpen = false
            sideMenuTrailingConstraints?.constant = sideMenuWidth
        }else{
            isSidemenuOpen = true
            sideMenuTrailingConstraints?.constant = 0
        }
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
        print(isSidemenuOpen)
    }
    func showBookPage(){
        print("showBookPageFunc")
        let bookStoryboard = UIStoryboard(name: "Book", bundle: nil)
        guard let startVC = bookStoryboard.instantiateViewController(withIdentifier: "StartViewController") as? StartViewController  else {
            return print("Bookstoryborad faild")
        }
        UIApplication.shared.delegate?.window!!.rootViewController?.show(startVC, sender: nil)
        
    }
    func showLoginPage(){
        print("showLoginPage")
        let loginStoryboard = UIStoryboard(name: "Login",bundle: nil)
        guard let loginVC = loginStoryboard.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController  else {
            return print("Loginstoryborad faild")
        }
        UIApplication.shared.delegate?.window!!.rootViewController?.show(loginVC, sender: nil)
    }
    func showMovieDetailPage(){
        print("showMovieDetailPage")
        let MovieDetailStoryboard = UIStoryboard(name: "MovieInfoStoryboard",bundle: nil)
        guard let MovieDetailVC = MovieDetailStoryboard.instantiateViewController(withIdentifier: "MovieViewController") as?  MovieViewController else {
            return print("MovieDetailStoryboard faild")
        }
        UIApplication.shared.delegate?.window!!.rootViewController?.show(MovieDetailVC, sender: nil)

    }
    
    private func configure(){
        // MARK: delegate
        
        
        // MARK: MainView
        mainView.menuBar.indicatorViewWidthConstraint.constant = view.frame.width / 4
        // MARK: autolayout setting
        sideMenu.translatesAutoresizingMaskIntoConstraints = false
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: addSubview
        view.addSubview(mainView)
        view.addSubview(sideMenu)
        
        // MARK: autolayout
        autolayout()
        
    }
    
    // MARK: Autolayout
    var sideMenuSlideWitdthConstraints: NSLayoutConstraint?
    var sideMenuTrailingConstraints: NSLayoutConstraint?
    private func autolayout(){

        // MARK: mainView
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: sideMenu.leadingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        // MARK: sideMenu
        
        sideMenu.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        sideMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        sideMenuSlideWitdthConstraints = sideMenu.widthAnchor.constraint(equalToConstant: sideMenuWidth)
        sideMenuSlideWitdthConstraints!.isActive = true
        
        sideMenuTrailingConstraints = sideMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: sideMenuWidth)
        sideMenuTrailingConstraints!.isActive = true
    }

}
