//
//  ViewController.swift
//  CollectionTableView
//
//  Created by alex-mac on 17/4/13.
//  Copyright © 2017年 zhanxing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //多列表格(添加子控制器)
        //父控制器
        let viewController = view.viewController_lmy()
        //子控制器(表格)
        let mainController : CollectionViewController = CollectionViewController(nibName: "CollectionViewController", bundle: nil)
        //1.[父视图控制器 addChildViewController:子视图控制器];
        viewController?.addChildViewController(mainController)
        //2.子控制器大小位置
        mainController.view.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 300)
        //3.[父视图控制器.view addSubview:子视图控制器.view];
        viewController?.view.addSubview(mainController.view)
        // 4.[子视图控制器 didMoveToParentViewController:父视图控制器];
        mainController.didMove(toParentViewController: viewController)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}

public extension UIView{
    /// 获取响应链上的UIViewController
    ///
    /// - Returns: UIViewController?
    func viewController_lmy() -> UIViewController?{
        var responder:UIResponder? = self.next
        while responder != nil {
            if (responder?.isKind(of: UIViewController.self)) == true {
                let con = responder as? UIViewController
                return con
            }else {
                responder = responder?.next
            }
        }
        return nil
    }

}

