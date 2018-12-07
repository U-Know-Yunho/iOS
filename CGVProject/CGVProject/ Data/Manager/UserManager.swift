//
//  UserManager.swift
//  CGVProject
//
//  Created by Wi on 07/12/2018.
//  Copyright © 2018 Wi. All rights reserved.
//
import UIKit
import Foundation
import Alamofire

class UserManager {
    static let singleton = UserManager()
    private var _token: String?

    
    var hasToken: Bool {
        guard _token == nil else { return true }
        if let token = UserDefaults.standard.string(forKey: "token") {
            _token = token
            return true
        }
        return false
    }
    
    var token: String? {
        get { return hasToken ? "Token \(_token!)" : nil }
        set {
            _token = newValue
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }
    
    // API 호출 상태값을 관리할 변수
    var isCalling = false
    
    func signUp(param: Parameters) {
        
        // 인디케이터 뷰 애니메이션 시작
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //        self indicatorView.startAnimating()
        
        // API 중복 송신 방지 코드
        if self.isCalling == true {
            print("진행 중입니다. 잠시만 기다려주세요.")
            return
        } else {
            self.isCalling = true
        }
        
        // 1. 전달할 값 준비
        // 1-1. 이미지 있으면 이미지 인코딩 처리
        
        // 1-3. header를 설정해서 json 형태로 인코딩 할 것을 서버에 전달
        let header: HTTPHeaders = [ "Content-Type" : "application/json"]
        
        // 2. API 호출, json 형태로 인코딩하여 body 전달

        Alamofire.request(API.AuthURL.signUp, method: .post, parameters: param, encoding: JSONEncoding.default, headers: header)
            .validate(statusCode: 200...300)
            .responseJSON { (response) in
                
                // 인디케이터 뷰 애니메이션 종료
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                //                self.indicatorView.stopAnimating()
                
                switch response.result {
                case .success(let user):
                    print("가입완료 Login :", user)
                    MainViewController.singleton.showBookPage()
                case .failure(let error):
                    self.isCalling = false
                    print(error.localizedDescription)
                }
        }
        
        
        
    }

}
