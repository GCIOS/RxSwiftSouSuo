//
//  ContainerViewModel.swift
//  sousuo
//
//  Created by 高崇 on 17/3/29.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContainerViewModel {
    
    //output
    var models: Driver<[Hero]>
    
    init(withSearchText searchText: Observable<String>, service: SearchService) {
        models = searchText
            .debug()
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .flatMap { text in
                return service.getHeros(withName: text)
            }.asDriver(onErrorJustReturn: [])
    }
}
