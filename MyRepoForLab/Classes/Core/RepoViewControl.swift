//
//  RepoViewControl.swift
//  MyRepoForLab
//
//  Created by Miguel Angel Valencia Colina on 7/31/20.
//

import Foundation

public class RepoViewControl {
    
    private let repoViewController: RepoViewController
    
    public init() {
        self.repoViewController = RepoViewController(titleText: "Aquí va el título", subtitleText: "Aquí va el subtítulo", image: nil)
    }
    
    public func presentRepoView(parentViewController: UIViewController) {
        parentViewController.present(repoViewController, animated: true, completion: nil)
    }
    
}
