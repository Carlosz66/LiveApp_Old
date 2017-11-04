//
//  ViewController.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/13.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(MyCalendarView(frame: CGRectMake(0, 0, 0, 0)));
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

