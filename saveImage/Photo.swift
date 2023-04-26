//
//  Photo.swift
//  saveImage
//
//  Created by Mohan K on 16/03/23.
//

import Foundation
import CoreData
import UIKit

@objc (Photo)
class Photo: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var content: UIImage?
    @NSManaged public var title: String?

}

extension Photo : Identifiable {

}
