//
//  Student.swift
//  saveImage
//
//  Created by Mohan K on 16/03/23.
//

import Foundation
import UIKit
import CoreData

@objc(Student)

class Student: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var rollNumber: String?
    @NSManaged public var email: String?
    @NSManaged public var phonenumber: String?

}

extension Student : Identifiable {

}
