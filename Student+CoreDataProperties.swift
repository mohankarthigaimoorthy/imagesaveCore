//
//  Student+CoreDataProperties.swift
//  saveImage
//
//  Created by Mohan K on 16/03/23.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var rollNumber: Int32
    @NSManaged public var email: String?
    @NSManaged public var phonenumber: Int32

}

extension Student : Identifiable {

}
