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
        //print("Lovely weather.")
    }
}

class ViewController: UIViewController {
    
    //Variables
    
    //The course objects
    var mathRel = course()
    var proRel = course()
    var otherRel = course()
    
    var curCourses = course() //Current course type to display
    
    //Outlets
    
    //Function to load in the default classes
    func loadCourses(){
        //Add Math related class titles
        let mTitles = ["CSC 185", "CSC 195"]
        //Add Math related images
        let mImg = [UIImage(named: "CSC185.png")!, UIImage(named: "CSC195.png")!]
        //Add Math related rating
        let mChal = [2, 4]
        
        //create the math courses
        mathRel = course(title: mTitles, lectureImg: mImg, challenge: mChal)
        
        //Add Programming related class titles
        let pTitles = ["CSC 190", "CSC 191", "CSC 308"]
        //Add Programming related images
        let pImg = [UIImage(named: "CSC190.png")!, UIImage(named: "CSC191.png")!, UIImage(named: "CSC308.png")!]
        //Add Programming related rating
        let pChal = [3, 3, 2]
        
        //create the programming courses
        proRel = course(title: pTitles, lectureImg: pImg, challenge: pChal)
        
        //Add Other related class titles
        let oTitles = ["CSC 310", "CSC 313", "CSC 340"]
        //Add Other related images
        let oImg = [UIImage(named: "CSC310.png")!, UIImage(named: "CSC313.png")!, UIImage(named: "CSC340.png")!]
        //Add Other related rating
        let oChal = [3, 2, 3]
        
        //create the other courses
        otherRel = course(title: oTitles, lectureImg: oImg, challenge: oChal)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Load in the courses
        loadCourses()
        
    }


}

