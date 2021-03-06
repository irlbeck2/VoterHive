//  SecondOpeningScreen.swift
//  MobileVoterOutreachApplication
//
//  Created by Dylan  Irlbeck on 6/29/18.
//  Copyright © 2018 Dylan  Irlbeck. All rights reserved.
//
import SwiftMultiSelect
import BEMCheckBox
import MessageUI
import ContactsUI
import CoreData
import RevealingSplashView
import SCLAlertView

class SecondOpeningScreen: UIViewController, SwiftMultiSelectDelegate, UITableViewDelegate, UITableViewDataSource, MFMessageComposeViewControllerDelegate {
   
    
    
    
    
    //boolean to set up initial # of table view cells
    var openingBoolean: Bool = true
    
    //var contactArray = [personInfo]()
    
    var theCoreDataContactArray = [ContactArray]()
    
    var counter: Int = 0
    
    var localCount: Int = 1
    
    var lastIndex: Int = 1
    
    var labelArray = [TableDisplay]()
    
    var currentIndexPathArr = [IndexPath]()
    
    var lastRow: Int = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var aNumb: Int = 0
        let thisRequest: NSFetchRequest<TableDisplay> = TableDisplay.fetchRequest()
        do {
            //
            
            let theNames = try PersistenceService.context.fetch(thisRequest)
            aNumb = theNames.count
           
        } catch {}
        
//        if (aNumb > 0) {
//            return aNumb
//        } else {
//            return 1
        return aNumb
        }
    
    // to ensure app does not crash on table view reload data
    var tracker: Bool = false
    
    @IBOutlet weak var contactTableView: UITableView!
    
   
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //pull the current label array from core data
        let thisRequest: NSFetchRequest<TableDisplay> = TableDisplay.fetchRequest()
        do {
            //
            
            let theNames = try PersistenceService.context.fetch(thisRequest)
            labelArray = theNames
           
        } catch {}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainScreenTableViewCell
        while (counter < labelArray.count) {
            cell.nameField.text = labelArray[counter].someName
            
            for person in theCoreDataContactArray {
               
                var aString = person.firstName! + person.middleName! + person.lastName!
                
                
                if (aString.trimmingCharacters(in: .whitespacesAndNewlines) == labelArray[counter].someName?.trimmingCharacters(in: .whitespacesAndNewlines)) {
                    
                    cell.currentPerson = person
                    if (person.checks == 1) {
                        cell.FirstCheck.setOn(true, animated: true)
                    }
                    if (person.checks == 2) {
                        cell.FirstCheck.setOn(true, animated: true)
                        cell.SecondCheck.setOn(true, animated: true)
                    }
                    if (person.checks == 3) {
                        cell.FirstCheck.setOn(true, animated: true)
                        cell.SecondCheck.setOn(true, animated: true)
                        cell.ThirdCheck.setOn(true, animated: true)
                    }
                }
            }
            
            cell.viewController = self
            
            counter += 1
            return(cell)
        }
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle:   UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        counter = 0
        var privateCount = 0
        if (editingStyle == .delete) {
            //arrStudentName.remove(at: indexPath.row)
            contactTableView.beginUpdates()
            //print(labelArray[indexPath.row])
            let fetchRequest: NSFetchRequest<TableDisplay> = TableDisplay.fetchRequest()
            
                    do {
            
                        let people = try PersistenceService.context.fetch(fetchRequest)
            
                        for x in people {
                            if (privateCount == indexPath.row) {
                            let x:NSManagedObject = x as! NSManagedObject
                            print(indexPath.row)
                            print("above is the index path")
                            PersistenceService.context.delete(x)
                            print("Deletion has occurred")
                            }
                            privateCount += 1
                            
                        }
                        //print(people.count)
                        PersistenceService.saveContext()
                        PersistenceService.context.refreshAllObjects()
            
            
            
                    } catch {}
            
            labelArray.remove(at: indexPath.row)
            contactTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            localCount -= 1
            
            contactTableView.endUpdates()

        }
    }
    
    
    
    // detect when table view has finished loading its data
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let lastVisibleIndexPath = tableView.indexPathsForVisibleRows?.last {
            if indexPath == lastVisibleIndexPath {
                //("this function processed")
                currentIndexPathArr.removeAll()
                tracker = false
                //print(counter)
                
            }
        }
    }
    
    func displayMessages(body: String, number: String) {
        let messageText = body
        let phoneNumber = number
        
        // checks to see if we're allowed to send texts
        if !MFMessageComposeViewController.canSendText() {
            print("SMS services are not available")
        }
        
        // composes message
        let messageVC = MFMessageComposeViewController()
        messageVC.body = messageText;
        messageVC.recipients = [phoneNumber]
        messageVC.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate;
        
        // displays message
        
        self.present(messageVC, animated: true, completion: nil)
        
        
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        print("Dismiss message")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func getContacts() {
        
        var aBool: Bool? = nil
        
        var checkCoreCount: Int? = nil
        var checkLocalCount: Int? = nil
        var currentCoreArray: [ContactArray]? = nil
        
        print(self.theCoreDataContactArray.count)
        print("above is initial count")
//        //request to get the first boolean, so as to only run the majority of this function once
//        let aRequest: NSFetchRequest<LoadingContacts> = LoadingContacts.fetchRequest()
//
//        do {
//
//            let boolArrayCore = try PersistenceService.context.fetch(aRequest)
//            aBool = boolArrayCore[0].shouldLoad
//            checkCoreCount = Int(boolArrayCore[0].contactCount)
//
//
//        } catch {}
//
        //grab the current core data contact array
        let contactArrayRequest: NSFetchRequest<ContactArray> = ContactArray.fetchRequest()
        print("we are in contactArrayRequest")
        do {
            
            let contactArrayCore = try PersistenceService.context.fetch(contactArrayRequest)
            currentCoreArray = contactArrayCore
           
            print("current core array count = \(currentCoreArray?.count)")
            
        } catch {}
        
        
        var results: [CNContact] = []
        
        let fetchRequest = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey as CNKeyDescriptor, CNContactFamilyNameKey as CNKeyDescriptor, CNContactMiddleNameKey as CNKeyDescriptor, CNContactEmailAddressesKey as CNKeyDescriptor,CNContactPhoneNumbersKey as CNKeyDescriptor])
        
        fetchRequest.sortOrder = CNContactSortOrder.userDefault
        
        let store = CNContactStore()
        var number = -1
        var phoneNumber : String = ""
        do {
            try store.enumerateContacts(with: fetchRequest, usingBlock: { (contact, stop) -> Void in
                
                let phoneNumbers = contact.phoneNumbers
                
                var boolToCheckIfSimilar = true
                
                for phnCtr in phoneNumbers
                {
                    phoneNumber = (phnCtr.value as! CNPhoneNumber).value(forKey: "digits") as! String
                
                    
                    
                   
                }
               
                for aContact in currentCoreArray! {
                    let aFirstName = aContact.firstName!
                    let aMiddleName = aContact.middleName!
                    let aLastName = aContact.lastName!
                   

//                    let aString: String = aContact.firstName! + aContact.middleName! + aContact.lastName!
//                    print(aString + " this is a string")
                
                    if (aFirstName == contact.givenName && aMiddleName == (" " + contact.middleName) && aLastName == contact.familyName) {
                       
                        if (aContact.phone != phoneNumber) {
                            
                            aContact.phone = phoneNumber

                        }
                        //means our core data contact array already has a contact stored, this is for adding new contacts
                        boolToCheckIfSimilar = false
                    } else {
                        //else, add the contact into our core data
                       
                        
                    }
                }
                
                //add in a function to check for inconsistent contacts
                
                if (boolToCheckIfSimilar) {
                    
                    let person = ContactArray(context: PersistenceService.context)
                    person.firstName = contact.givenName
                    if (contact.familyName != nil) {
                    person.lastName = contact.familyName
                    } else {
                        person.lastName = ""
                    }
                    if (contact.middleName != nil) {
                    person.middleName = " " + contact.middleName
                    } else {
                        person.middleName = ""
                    }
                    person.checks = Int16(0)
                    person.phone = phoneNumber
                    person.state = ""
                    PersistenceService.saveContext()
                    //self.anArray.append(person)
                }
                
                //results.append(contact)
                
            })
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        
       
        
//        print(anArray.count)
//        print(anArray[0].name)
        
        let thisRequest: NSFetchRequest<ContactArray> = ContactArray.fetchRequest()

                 do {
        
                    let theFinalArr = try PersistenceService.context.fetch(thisRequest)
                    self.theCoreDataContactArray = theFinalArr
                    
        //
                } catch {}

        
        PersistenceService.saveContext()
        print(self.theCoreDataContactArray.count)
        print("above is the post count")
       
        
    }
    
    func callGetContacts() {
        getContacts()
    }

    
    @IBAction func buttonAction(_ sender: Any) {
        let authorizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        
        if (authorizationStatus == .authorized) {
        
            DispatchQueue.global().async {
                do {
                    print("INSIDE HERE")
                self.callGetContacts()
                }
                catch {
                    print("error with get contacts")
                }
                DispatchQueue.main.async(execute: {
                SwiftMultiSelect.Show(to: self)
                })
            }
        }
            else  {
            let alertView = SCLAlertView()
            alertView.showError("Error", subTitle: "You have not allowed VoterHive to access your contacts. For this app to serve its purpose, it must access your contacts. Please change your privacy settings.")
        }
        
    }
    
    @IBOutlet weak var addContacts: RoundButton!
    
    @IBOutlet weak var hiveLabel: UILabel!
    
     @IBOutlet weak var hiveView: UIView!
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        addContacts.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 0.085
        )
        if UIDevice.current.iPhoneX {
            hiveLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let verticalConstraint = NSLayoutConstraint(item: hiveLabel, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: mainView, attribute: .top, multiplier: 1, constant: 35)
            hiveView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 0.08)
            contactTableView.frame = CGRect(x: 0, y: screenSize.height*0.08, width: screenSize.width, height: screenSize.height)
            NSLayoutConstraint.activate([verticalConstraint])
            print("This device is a iPhoneX")
        
        } else {
        //hiveView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 1.0)
         let verticalConstraint = NSLayoutConstraint(item: hiveLabel, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: mainView, attribute: .top, multiplier: 1, constant: 20)
        hiveView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 0.075)
            contactTableView.frame = CGRect(x: 0, y: screenSize.height*0.07, width: screenSize.width, height: screenSize.height)
        NSLayoutConstraint.activate([verticalConstraint])
            print("This device is not an iPhoneX")
        }
        
        
        contactTableView.rowHeight = 125
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "Icon-180.png")!,iconInitialSize: CGSize(width: 120, height: 120), backgroundColor: UIColor(red: 255, green: 255, blue: 255, alpha: 1))
        
                //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        let timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
             revealingSplashView.playWoobleAnimation()
        }

       
        
       
        //getContacts()
//        print(anArray[0].name)
        //print(anArray.count)
        let thisRequest: NSFetchRequest<ContactArray> = ContactArray.fetchRequest()
        
        do {
            
            let theFinalArr = try PersistenceService.context.fetch(thisRequest)
            self.theCoreDataContactArray = theFinalArr
            
            //
        } catch {}
        
        
        PersistenceService.saveContext()
        contactTableView.dataSource = self
        contactTableView.delegate = self
       

        
        //Register delegate
        
        SwiftMultiSelect.dataSourceType = .phone
        SwiftMultiSelect.delegate       = self
        
        
        
//////////        THIS IS FOR DELETING CORE DATA
//        let fetchRequest: NSFetchRequest<ContactArray> = ContactArray.fetchRequest()
//
//        do {
//
//            let people = try PersistenceService.context.fetch(fetchRequest)
//
//            for x in people {
//                let x:NSManagedObject = x as! NSManagedObject
//                PersistenceService.context.delete(x)
//            }
//            //print(people.count)
//            PersistenceService.saveContext()
//            PersistenceService.context.refreshAllObjects()
//
//
//
//        } catch {}
////
//        let newRequest: NSFetchRequest<TableDisplay> = TableDisplay.fetchRequest()
//
//        do {
//
//            let people = try PersistenceService.context.fetch(newRequest)
//
//            for x in people {
//                let x:NSManagedObject = x as! NSManagedObject
//                PersistenceService.context.delete(x)
//            }
//            //print(people.count)
//            PersistenceService.saveContext()
//            PersistenceService.context.refreshAllObjects()
//
//
//
//        } catch {}
//
//
//
   }

    //MARK: - SwiftMultiSelectDelegate
    
    //User write something in searchbar
    func userDidSearch(searchString: String) {
        
        //print("User is looking for: \(searchString)")
        
    }
    
    //User did unselect an item
    func swiftMultiSelect(didUnselectItem item: SwiftMultiSelectItem) {
        //print("row: \(item.title) has been deselected!")
    }
    
    //User did select an item
    func swiftMultiSelect(didSelectItem item: SwiftMultiSelectItem) {
        //print("item: \(item.title) has been selected!")
    }
    
    //User did close controller with no selection
    func didCloseSwiftMultiSelect() {
        //print("no items selected")
    }
    
    //User completed selection
    func swiftMultiSelect(didSelectItems items: [SwiftMultiSelectItem]) {
        
        var aNumb: Int = 0
        let thisRequest: NSFetchRequest<TableDisplay> = TableDisplay.fetchRequest()
        do {
            //
            
            let theNames = try PersistenceService.context.fetch(thisRequest)
            aNumb = theNames.count
            
        } catch {}
        print(aNumb)
        if (aNumb == 5) {
            return
            //show an alert
        }
        var count = 5 - aNumb
        for item in items{
            if (count == 0) {
                break;
            }
            let person = TableDisplay(context: PersistenceService.context)
            person.someName = item.title
            count -= 1
            print("\(item.title) added to table display")
        }
        PersistenceService.saveContext()
        PersistenceService.context.refreshAllObjects()
        counter = 0
        
        contactTableView.reloadData()
        
   
       
        
    }
}
    


