//
//  MainScreenTableViewCell.swift
//  MobileVoterOutreachApplication
//
//  Created by Dylan  Irlbeck on 7/3/18.
//  Copyright © 2018 Dylan  Irlbeck. All rights reserved.
//

import UIKit
import BEMCheckBox
import SCLAlertView
import MessageUI

class MainScreenTableViewCell: UITableViewCell, BEMCheckBoxDelegate  {
    
    

    
    @IBOutlet weak var currentElection: UILabel!
    
    @IBOutlet weak var hasVoted: UILabel!
    
    @IBOutlet weak var isRegistered: UILabel!
    
    @IBOutlet weak var isVoting: UILabel!
    
    @IBOutlet weak var viewMessages: UIButton!
    
    @IBOutlet weak var nameField: UILabel!
    
    @IBOutlet weak var ThirdCheck: BEMCheckBox!
    
    @IBOutlet weak var SecondCheck: BEMCheckBox!
    
    @IBOutlet weak var FirstCheck: BEMCheckBox!
    
    weak var viewController : SecondOpeningScreen?
    
    weak var contactState: State?

    var currentPerson: ContactArray? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }
    
    //Action for the third check mark 
    @IBAction func thirdCheckClicked(_ sender: Any) {
        
        
        
        var testString = ""
        if (self.nameField.text != "VoterHive") {
            if (self.currentPerson == nil) {
                testString = "Kate"
            } else {
                testString = self.currentPerson!.firstName!
            }
        }
        
        // run a function
        if (ThirdCheck.on == true) {
            ThirdCheck.setOn(false, animated: false)
            let appearance = SCLAlertView.SCLAppearance(
                kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                showCloseButton: false
            )
            
            let alertView = SCLAlertView(appearance: appearance)
            alertView.addButton("Cancel") {
                alertView.hideView()
            }
            alertView.addButton("Reach Out") {
                //put code for SMS Voting message here
                let yourState = (State(of: (self.currentPerson?.state)!))
                if (yourState.canVoteEarly) {
                    self.viewController?.displayMessages(body: "Have you requested your early ballot?", number: (self.currentPerson?.phone)! )
                }
                else {
                    self.viewController?.displayMessages(body: "Will you be able to vote there in person?", number: (self.currentPerson?.phone)! )
                }
            }
            alertView.addButton("Check \(testString)'s Mail-In Ballot") {
                self.viewController?.displayMessages(body: "You can check your early ballot status here: \(State(of: (self.currentPerson?.state)!).checkBallotLink)", number: (self.currentPerson?.phone)! )
            }
            alertView.addButton("Find \(testString)'s Polling Place") {
                self.viewController?.displayMessages(body: "You can find your polling place with this website: \(State(of: (self.currentPerson?.state)!).findPollingPlaceLink)", number: (self.currentPerson?.phone)! )
            }
            alertView.addButton("Get \(testString)'s Mail-In Ballot") {
                self.viewController?.displayMessages(body: "You can ask for your mail-in ballot here: \(State(of: (self.currentPerson?.state)!).requestMailInBallotLink)", number: (self.currentPerson?.phone)! )
            }
            alertView.addButton("Voted!") {
                var num = 0
                self.ThirdCheck.setOn(true, animated: true)
                if (self.FirstCheck.on == false || self.SecondCheck.on == false ) {
                    self.ThirdCheck.setOn(false, animated: true)
                }
                for count in (self.viewController?.theCoreDataContactArray)! {
                    let aString: String = count.firstName! + count.middleName! + count.lastName!
                    if (aString.uppercased().trimmingCharacters(in: .whitespaces) == self.nameField.text?.uppercased().trimmingCharacters(in: .whitespaces)) {
                        self.viewController?.theCoreDataContactArray[num].checks = 3
                    }
                    num += 1
                }
            }
            
            alertView.showSuccess("Voted?", subTitle: "Has \(testString) turned in an early ballot? Make sure they cast it on time!")
        } else if (ThirdCheck.on == false) {
            ThirdCheck.setOn(true, animated: false)
            let appearance = SCLAlertView.SCLAppearance(
                kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                showCloseButton: false
            )
            
            let alertView = SCLAlertView(appearance: appearance)
            alertView.addButton("Cancel") {
                alertView.hideView()
            }
            alertView.addButton("Erase") {
                var num = 0
                self.ThirdCheck.setOn(false, animated: true)
                for count in (self.viewController?.theCoreDataContactArray)! {
                    let aString: String = count.firstName! + count.middleName! + count.lastName!
                    if (aString.uppercased().trimmingCharacters(in: .whitespaces) == self.nameField.text?.uppercased().trimmingCharacters(in: .whitespaces)) {
                        self.viewController?.theCoreDataContactArray[num].checks = 2
                        
                    }
                    num += 1
                }
               
            }
            alertView.showSuccess("Voted?", subTitle: "Do you want to erase \(testString)'s Voted checkmark?")
            print("User tried to delete Voted check")
        }
        else {
            
        }
        
        print ("User tapped third check")
        
    }
    
    

    
    @IBAction func firstCheckClicked(_ sender: Any) {
       
        var testString = ""
        if (self.nameField.text != "VoterHive") {
            testString = self.currentPerson!.firstName!
            }
        // run a function
        //SCLAlertView().showSuccess("Voting", subTitle: "Is \(self.currentPerson.name) voting? If you have not done so, please click the 'Contact' button below to send a message. If you have heard back with a confirmation, please select Done")
        if (FirstCheck.on == true) {
        FirstCheck.setOn(false, animated: false)
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false
        )
        
        let alertView = SCLAlertView(appearance: appearance)
        alertView.addButton("Cancel") {
            alertView.hideView()
        }
            
        alertView.addButton("Reach Out") {
            print("First reach out clicked")
            var phoneNumber: String = ""
            if (self.nameField.text == "VoterHive") {
                return
            }
            if ((self.viewController?.theCoreDataContactArray.count)! > 0) {
            for contact in (self.viewController?.theCoreDataContactArray)! {
                let aString: String = contact.firstName! + contact.middleName! + contact.lastName!
                var nameFieldString: String = self.nameField.text as! String
                if (aString.uppercased().trimmingCharacters(in: .whitespaces) == (nameFieldString.uppercased().trimmingCharacters(in: .whitespaces))) {
                    
                    phoneNumber = contact.phone!
                    break
                }
            }
            }
            // to get rid of the "optional(x)" in display
            if (phoneNumber == nil || phoneNumber == "") {
                phoneNumber = "12345678910"
            }
            self.viewController?.displayMessages(body: "Hey, \(testString), I'm using this app VoterHive to see if my friends are voting Democratic for the upcoming November midterms. Are you going to vote for Democrats?", number: (phoneNumber) )
                        //put code for SMS Voting message here
            
        }
            
        alertView.addButton("Voting!") {
            self.FirstCheck.setOn(true, animated: true)
            var num = 0
            
            if (self.nameField.text == "VoterHive") {
                return
            }
            
            for count in (self.viewController?.theCoreDataContactArray)! {
                let aString: String = count.firstName! + count.middleName! + count.lastName!
                if (aString.uppercased().trimmingCharacters(in: .whitespaces) == self.nameField.text?.uppercased().trimmingCharacters(in: .whitespaces)) {
                    self.viewController?.theCoreDataContactArray[num].checks = 1
                    
                }
                num += 1
            }
        }
        
            alertView.showSuccess("Voting?", subTitle: "Ask if \(testString)'s voting for Democrats in November. Remember, elections have consequences!")
        } else if (FirstCheck.on == false) {
            FirstCheck.setOn(true, animated: false)
            let appearance = SCLAlertView.SCLAppearance(
                kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                showCloseButton: false
            )
            
            let alertView = SCLAlertView(appearance: appearance)
            alertView.addButton("Cancel") {
                alertView.hideView()
            }
            alertView.addButton("Erase") {
                var num = 0
                self.FirstCheck.setOn(false, animated: true)
                for count in (self.viewController?.theCoreDataContactArray)! {
                    let aString: String = count.firstName! + count.middleName! + count.lastName!
                    if (aString.uppercased().trimmingCharacters(in: .whitespaces) == self.nameField.text?.uppercased().trimmingCharacters(in: .whitespaces)) {
                        self.viewController?.theCoreDataContactArray[num].checks = 0
                        
                    }
                    num += 1
                }
            }
            alertView.showSuccess("Voting?", subTitle: "Do you want to erase \(testString)'s check mark?")
            print("User tried to delete voting check")
        }
        else {
            
        }
        if (FirstCheck.on == false || SecondCheck.on == false) {
            ThirdCheck.setOn(false, animated: true)
        }
        
        
    }
    
    
    @IBAction func secondCheckClicked(_ sender: Any) {
        
        
      
        var testString = ""
        if (self.nameField.text != "VoterHive") {
                testString = self.currentPerson!.firstName!
            
        }
        
        //this condition happens the first time someone clicks the check (automatically turns it on, so have to treat this case as if it was on and turn it off immediately to show alert)
        if (SecondCheck.on == true) {
            SecondCheck.setOn(false, animated: false)
            let appearance = SCLAlertView.SCLAppearance(
                kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                showCloseButton: false
                
            )
            
           
            
            let alertView = SCLAlertView(appearance: appearance)
            
            alertView.addButton("Cancel") {
                alertView.hideView()
            }
            alertView.addButton("Reach Out") {
                if (self.nameField.text == "VoterHive") {
                    return
                }
                //put code for SMS Voting message here
                self.viewController?.displayMessages(body: "Which state do you want to vote in? Are you registered to vote there?", number: (self.currentPerson?.phone)! )
            }
            let txt = alertView.addTextField("Enter \(testString)'s state")
            
            if (currentPerson?.state != nil) {
                txt.text = currentPerson?.state!
            }
            
            //self.currentPerson.state = State(of: txt.text)
            
            alertView.addButton("Register \(testString)") {
                print("hit register button")
//                if (txt.text == "") {
//                    return
//                }
                var num = 0
                    for count in (self.viewController?.theCoreDataContactArray)! {
                        let aString: String = count.firstName! + count.middleName! + count.lastName!
                        if (aString.uppercased().trimmingCharacters(in: .whitespaces) == self.nameField.text?.uppercased().trimmingCharacters(in: .whitespaces)) {
                            
                        
                            let txtValue: String = txt.text!
                            
                            //self.contactState = State(of: txtValue)
                            print(self.viewController?.theCoreDataContactArray[num].checks)
                            print(self.viewController?.theCoreDataContactArray[num].state)
                            self.viewController?.theCoreDataContactArray[num].state = State(of: txtValue).name
                            
                            PersistenceService.saveContext()
                            
                        }
                        num += 1
                    }
                //put code for SMS Voting message hereif self.currentPerson.state.canRegisterOnline {
                
                let yourState = (State(of: (self.currentPerson?.state)!))
                if  (yourState.canRegisterOnline) {
                self.viewController?.displayMessages(body: "You can register to vote here: \(yourState.registerToVoteLink)", number: (self.currentPerson?.phone)! )
                }
                                 else {
                    self.viewController?.displayMessages(body: "You can't register to vote online in \(yourState.name), but you should vote for somebody who'll change that. Get the process started by going here: \(yourState.registerToVoteLink)", number: (self.currentPerson?.phone)! )
                                 }
            }
            
            alertView.addButton("Check \(testString)'s Registration") {
//                if (txt.text == "") {
//                    return
//                }
                var num = 0
                for count in (self.viewController?.theCoreDataContactArray)! {
                    let aString: String = count.firstName! + count.middleName! + count.lastName!
                    if (aString.uppercased().trimmingCharacters(in: .whitespaces) == self.nameField.text?.uppercased().trimmingCharacters(in: .whitespaces)) {
                        
                        
                        let txtValue: String = txt.text!
                        
                        //self.contactState = State(of: txtValue)
                        print(self.viewController?.theCoreDataContactArray[num].checks)
                        print(self.viewController?.theCoreDataContactArray[num].state)
                        self.viewController?.theCoreDataContactArray[num].state = State(of: txtValue).name
                        
                        PersistenceService.saveContext()
                        
                    }
                    num += 1
                }
               
                self.viewController?.displayMessages(body: "Go here to see if you're registered to vote: \(State(of: (self.currentPerson?.state)!).checkRegistrationLink)", number: (self.currentPerson?.phone)! )
            }
            alertView.addButton("Registered!") {
                var tracker = 0
                for count in (self.viewController?.theCoreDataContactArray)! {
                    let aString: String = count.firstName! + count.middleName! + count.lastName!
                    if (aString.uppercased().trimmingCharacters(in: .whitespaces) == self.nameField.text?.uppercased().trimmingCharacters(in: .whitespaces)) {
                        self.viewController?.theCoreDataContactArray[tracker].state = txt.text
                        print(self.viewController?.theCoreDataContactArray[tracker].state)
                    }
                    tracker += 1
                }
                var localBool = true
                var num = 0
                self.SecondCheck.setOn(true, animated: true)
                
                if (self.FirstCheck.on == false) {
                    self.SecondCheck.setOn(false, animated: true)
                    localBool = false
                }
                if (localBool) {
                for count in (self.viewController?.theCoreDataContactArray)! {
                    let aString: String = count.firstName! + count.middleName! + count.lastName!
                    if (aString.uppercased().trimmingCharacters(in: .whitespaces) == self.nameField.text?.uppercased().trimmingCharacters(in: .whitespaces)) {
                        self.viewController?.theCoreDataContactArray[num].checks = 2
                        
                    }
                    num += 1
                }
                print(txt.text)
                }
            }
          
            alertView.showSuccess("Registered?", subTitle: "Ask if \(testString)'s registered to vote in their state. If they're not registered, they can't vote!")
        }
            else {
            if (SecondCheck.on == false) {
            SecondCheck.setOn(true, animated: false)
            let appearance = SCLAlertView.SCLAppearance(
                kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                showCloseButton: false
            )
            
            let alertView = SCLAlertView(appearance: appearance)
            alertView.addButton("Cancel") {
                alertView.hideView()
            }
            alertView.addButton("Erase") {
                var num = 0
                self.SecondCheck.setOn(false, animated: true)
                for count in (self.viewController?.theCoreDataContactArray)! {
                    let aString: String = count.firstName! + count.middleName! + count.lastName!
                    if (aString.uppercased().trimmingCharacters(in: .whitespaces) == self.nameField.text?.uppercased().trimmingCharacters(in: .whitespaces)) {
                        self.viewController?.theCoreDataContactArray[num].checks = 1
                        
                    }
                    num += 1
                }
            }
            alertView.showSuccess("Registered?", subTitle: "Do you want to erase \(testString)'s Registered checkmark?")
            print("User tried to delete registered check")
        }
       
        // run a function
        if (FirstCheck.on == false) {
            SecondCheck.setOn(false, animated: true)
        }
        
    }
    
 

}
}

