//
//  ContainerViewController.swift
//  sousuo
//
//  Created by 高崇 on 17/3/29.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    var searchBarText: Observable<String> {
        return searchBar.rx.text
            .orEmpty
            .throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
 
        let viewModel = ContainerViewModel(withSearchText: searchBarText, service: SearchService.shareInstance)
        
        viewModel.models
            .drive(tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = element.name
                cell.detailTextLabel?.text = element.desc
            }
            .disposed(by: disposeBag)
    }


}
