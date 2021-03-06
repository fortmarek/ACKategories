//
//  UIViewControllerChildrenTests.swift
//  ACKategories
//
//  Created by Jakub Olejník on 13/04/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import UIKit
import XCTest
import SnapKit
import ACKategories

final class UIViewControllerChildrenTests: XCTestCase {
    
    func testControllerIsAdded() {
        let vc = UIViewController()
        let childVC = UIViewController()
        
        vc.display(childViewController: childVC)
        
        XCTAssertEqual(childVC.parent, vc)
    }
    
    func testControllerIsAddedToViewIfNil() {
        let vc = UIViewController()
        let childVC = UIViewController()
        
        vc.display(childViewController: childVC)
        
        XCTAssertEqual(childVC.view.superview, vc.view)
    }
    
    func testControllerIsAddedToCorrectView() {
        let vc = UIViewController()
        let childVC = UIViewController()
        
        let container = UIView()
        vc.view.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        vc.display(childViewController: childVC, in: container)
        vc.view.layoutIfNeeded()
        
        XCTAssertEqual(childVC.view.superview, container)
        XCTAssertEqual(container.bounds, childVC.view.frame)
    }
    
    func testControllerIsRemovedWithCorrectParent() {
        let vc = UIViewController()
        let childVC = UIViewController()
        
        vc.display(childViewController: childVC)
        vc.remove(childViewController: childVC)
        
        XCTAssertNil(childVC.parent)
    }
    
    func testControllerIsNotRemovedWithIncorrectParent() {
        let anotherVC = UIViewController()
        let parentVC = UIViewController()
        let childVC = UIViewController()
        
        parentVC.display(childViewController: childVC)
        anotherVC.remove(childViewController: childVC)
        
        XCTAssertEqual(childVC.parent, parentVC)
    }
}
