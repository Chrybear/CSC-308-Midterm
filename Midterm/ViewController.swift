//
//  ViewController.swift
//  Midterm
//
//  Author: Charles Ryan Barrett
//  Date: 3/7/2021
//  Description: Midterm project for CSC 308 at EKU. An iOS app that displays various computer science courses at EKU, along with a lecture slide from the class and an associated difficulty/challenge rating.
//

import UIKit

//Class for each course type

class course{
    var title = [String]() //Value to hold each class' title
    var lectureImg = [UIImage]() //Images for each class
    var challenge = [Int]() //Challenge level for each class
    
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
    
    //Current class index
    var curClass = 0
    
    //The course objects
    var mathRel = course()
    var proRel = course()
    var otherRel = course()
    
    var curCourses = course() //Current course type to display
    
    //Outlets
    
    //Outlet for main display
    @IBOutlet weak var mainDisp: UIImageView!
    
    //Label for current course name
    @IBOutlet weak var classTitle: UILabel!
    
    //Images for displaying challenge level
    @IBOutlet var challengeImages: [UIImageView]!
    
    //Button outlet to make the button nicer looking
    @IBOutlet weak var nxtBtn: UIButton!
    
    
    
    
    //Function for when a new course type is selected
    @IBAction func changeType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            curCourses = mathRel
        case 1:
            curCourses = proRel
        case 2:
            curCourses = otherRel
        default:
            curCourses = mathRel //Default is math related since it is the first one in the segment
        }
        //We have just changed subjects, so make the current class index 0
        curClass = 0
        //Show the new course view
        showCourses()
    }
    
    //Function for when the "Next" button is pressed
    @IBAction func changeClass(_ sender: Any) {
        //First, need to check if we're at the end of the classes. If so, loop back to start
        if curClass == curCourses.title.count-1{
            //All lists are the same lenght in the course object
            curClass = -1 //This is so when we incriment it turns into 0, the start
        }
        //Increment to next class
        curClass += 1
        
        //Show the next class
        showCourses()
        
    }
    
    
    //Function to display all information about the current course type when changed
    func showCourses(){
        classTitle.text = curCourses.title[curClass] //Get title of class at curClass index in the curCourses
        mainDisp.image = curCourses.lectureImg[curClass] //Set the lecture preview image of the course to the image at curClass index in curCourses
        //Update challenge rating; stars
        drawStars()
    }
    
    //Function to draw the difficulty level of the current class in star images
    func drawStars(){
        //Loop through the current difficulty rating
        for x in 0...curCourses.challenge[curClass]-1{
            
            challengeImages[x].isHidden = false //Make the stars visible
        }
        
        //Make any remaining ones hidden
        for y in curCourses.challenge[curClass]..<challengeImages.count{
            // It doesn't matter which one we count, all the lists are the same length
            challengeImages[y].isHidden = true //Make the stars hidden
        }
    }
    
    
    //Function to load in the default courses
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
        
        //Since this function runs on start, also add star images to the UIImageviews
        for x in challengeImages{
            x.image = UIImage(named: "star.png")
            x.isHidden = true //They should be initially hidden
        }
        
        //Set Default courses
        curCourses = mathRel
        //Display the current courses
        showCourses()
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Load in the courses
        loadCourses()
        //Make button nice looking
        nxtBtn.layer.cornerRadius = 20.0
        
    }


}

