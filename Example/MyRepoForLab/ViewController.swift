//
//  ViewController.swift
//  MyRepoForLab
//
//  Created by Miguel Angel Valencia on 07/31/2020.
//  Copyright (c) 2020 Miguel Angel Valencia. All rights reserved.
//

import UIKit
import MyRepoForLab

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .lightGray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let navigationController = self?.navigationController else { return }
            let repoControl: RepoViewControl = RepoViewControl()
            repoControl.presentRepoView(parentViewController: navigationController)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

