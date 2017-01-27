//
//  ViewController.swift
//  PageMenuDemoSegmentedControl
//
//  Created by Niklas Fahl on 1/20/15.
//  Copyright (c) 2015 Niklas Fahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAPSPageMenuDelegate {
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PAGE MENU"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        // MARK: - Scroll menu setup
        
        // Initialize view controllers to display and place in array
        var controllerArray : [UIViewController] = []
        
        var controller1 : TestTableViewController = TestTableViewController(nibName: "TestTableViewController", bundle: nil)
        controller1.parentNavigationController = self.navigationController
        controller1.title = "FAVORITES"
        controllerArray.append(controller1)
        
        var controller2 : RecentsTableViewController = RecentsTableViewController(nibName: "RecentsTableViewController", bundle: nil)
        controller2.title = "RECENTS"
        controller2.parentNavigationController = self.navigationController
        controllerArray.append(controller2)
        
        var controller3 : RecentsTableViewController = RecentsTableViewController(nibName: "RecentsTableViewController", bundle: nil)
        controller3.title = "FRIENDS"
        controller3.parentNavigationController = self.navigationController
        controllerArray.append(controller3)
        
        var controller4 : RecentsTableViewController = RecentsTableViewController(nibName: "RecentsTableViewController", bundle: nil)
        controller4.title = "OTHERS"
        controller4.parentNavigationController = self.navigationController
        controllerArray.append(controller4)
        
        // Customize menu (Optional)
        var parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(4.3),
            .scrollMenuBackgroundColor(UIColor.white),
            .viewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
            .bottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
            .selectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .menuMargin(20.0),
            .menuHeight(40.0),
            .selectedMenuItemLabelColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .unselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
            .menuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorRoundEdges(true),
            .selectionIndicatorHeight(6),
            .menuItemWidthBasedOnTitleTextWidth(true),
            .iconIndicator(true),                        //Activate the icon indicator
            .iconIndicatorView(self.getIndicatorView())  //Set custom icon indicator to show
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x:0.0,y:0.0,width:self.view.frame.width,height:self.view.frame.height), pageMenuOptions: parameters)
        
        // Optional delegate 
        pageMenu!.delegate = self
        
        self.view.addSubview(pageMenu!.view)
    }

    private func getIndicatorView()->UIView{
        
        let w:Int = 10
        let h:Int = 10
        let x:Int = 0
        let y:Int = 0
        
        let bounds:CGRect = CGRect(x: x, y: y, width: w, height: h)
        
        //Init view
        let view:UIView = UIView(frame:bounds)
        //Create mask
        let mask = CAShapeLayer()
        mask.frame = CGRect(x: x, y: y, width: w, height: h)
        let width = bounds.size.width
        let height = bounds.size.height
        let path = CGMutablePath()
        path.move(to: CGPoint(x: width/2, y: 0))
        path.addLine(to: CGPoint(x:width,y:height))
        path.addLine(to: CGPoint(x:0,y:height))
        path.addLine(to: CGPoint(x:width/2,y:0))
        mask.path = path
        view.layer.mask = mask
        
        let shape = CAShapeLayer()
        shape.frame = bounds
        shape.path = path
        shape.lineWidth = 3.0
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.black.cgColor
        
        view.layer.insertSublayer(shape, at: 0)
        
        return view
    }
    
    // Uncomment below for some navbar color animation fun using the new delegate functions
    
    func didMoveToPage(_ controller: UIViewController, index: Int) {
        print("did move to page")
        
//        var color : UIColor = UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
//        var navColor : UIColor = UIColor(red: 17.0/255.0, green: 64.0/255.0, blue: 107.0/255.0, alpha: 1.0)
//        
//        if index == 1 {
//            color = UIColor.orangeColor()
//            navColor = color
//        } else if index == 2 {
//            color = UIColor.grayColor()
//            navColor = color
//        } else if index == 3 {
//            color = UIColor.purpleColor()
//            navColor = color
//        }
//        
//        UIView.animateWithDuration(0.5, animations: { () -> Void in
//            self.navigationController!.navigationBar.barTintColor = navColor
//        }) { (completed) -> Void in
//            print("did fade")
//        }
    }
    
    func willMoveToPage(_ controller: UIViewController, index: Int) {
        print("will move to page")
        
//        var color : UIColor = UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
//        var navColor : UIColor = UIColor(red: 17.0/255.0, green: 64.0/255.0, blue: 107.0/255.0, alpha: 1.0)
//        
//        if index == 1 {
//            color = UIColor.orangeColor()
//            navColor = color
//        } else if index == 2 {
//            color = UIColor.grayColor()
//            navColor = color
//        } else if index == 3 {
//            color = UIColor.purpleColor()
//            navColor = color
//        }
//        
//        UIView.animateWithDuration(0.5, animations: { () -> Void in
//            self.navigationController!.navigationBar.barTintColor = navColor
//        }) { (completed) -> Void in
//            print("did fade")
//        }
    }
    
    
}
