//
//  ViewController.swift
//  Midterm
//
//  Created by user186035 on 3/6/21.
//

import UIKit

//Class for each course type

class course{
    var title = [String]() //Value to hold each class' title
    var lectureImg = [UIImage]() //Images for each class
    var challenge = [Int]() //Challenge level for each course
    
    //Constructor
    init(title: [String], lectureImg: [UIImage], challenge: [Int]) {
        self.title = title
        self.lectureImg = lectureImg
        self.challenge = challenge
    }
    
    //Default constructor
    init() {
        print("Lovely weather.")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

