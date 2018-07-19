//
//  ContactArray+CoreDataProperties.swift
//  
//
//  Created by Dylan  Irlbeck on 7/16/18.
//
//

import Foundation
import CoreData


extension ContactArray {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactArray> {
        return NSFetchRequest<ContactArray>(entityName: "ContactArray")
    }

    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var checks: Int16
    @NSManaged public var state: String?

}
