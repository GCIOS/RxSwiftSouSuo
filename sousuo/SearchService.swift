//
//  SearchService.swift
//  sousuo
//
//  Created by 高崇 on 17/3/29.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchService {
    static let shareInstance = SearchService()
    
    private init () {}
    
    
    func getHeros() -> Observable<[Hero]> {
        
        let path = Bundle.main.path(forResource: "heros", ofType: "plist")
        let heroArray = NSArray(contentsOfFile: path!) as! Array<[String : String]>
        
        var heros = [Hero]()
        
        for dic in heroArray {
            let hero = Hero(name: dic["name"]!, desc: dic["intro"]!, icon: dic["icon"]!)
            heros.append(hero)
        }
        
        return Observable.just(heros)
            .observeOn(MainScheduler.instance)
    }
    
    func getHeros(withName name: String) -> Observable<[Hero]> {
        let path = Bundle.main.path(forResource: "heros", ofType: "plist")
        let heroArray = NSArray(contentsOfFile: path!) as! Array<[String : String]>
        var heros = [Hero]()
        for dic in heroArray {
            if dic["name"]!.contains(name) {
                let hero = Hero(name: dic["name"]!, desc: dic["intro"]!, icon: dic["icon"]!)
                heros.append(hero)
            }
        }
        
        return Observable.just(heros)
            .observeOn(MainScheduler.instance)
    }
}
