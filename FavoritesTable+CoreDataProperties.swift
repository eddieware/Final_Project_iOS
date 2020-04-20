//
//  FavoritesTable+CoreDataProperties.swift
//  Final_Project_iOS
//
//  Created by EDUARDO MEJIA on 20/04/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//
//

import Foundation
import CoreData


extension FavoritesTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritesTable> {
        return NSFetchRequest<FavoritesTable>(entityName: "FavoritesTable")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var authors: String?
    @NSManaged public var descript: String?
    @NSManaged public var year: Int16
    @NSManaged public var image: String?

}
