//
//  ViewController.swift
//  ShopingApp
//
//  Created by Ahmed on 12/08/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
    }
    
    
    private func go() {
        let params: Parameters = [
            "product_id": 55
        ]
        let headers: HTTPHeaders = [
            "Authorization": "3ZhXaO2xGD3FuaM6ZRXSCYH2Vp4wtQCWvB1Gq8IRbv1Pmqhs8Kma8Cfxvx0Lgl1RpZWuOT",
            "lang": "en"
        ]
        AF.request(ApiPath.baseURL + ApiPath.FavoritesApiConst.favorites, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseData { resp in
            print(resp.response?.statusCode ?? "NO STATUS CODE")
            switch resp.result {
            case .success(let data):
                print(data)
                if let string = String(data: data, encoding: .utf8) {
                    print(string)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
