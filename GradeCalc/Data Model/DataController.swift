//
//  DataController.swift
//  GradeCalc
//
//  Created by Andrew Smith on 2023.07.15.
//

import Foundation
import CoreData

class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "GradeCalc")
	
	init() {
		container.loadPersistentStores { desc, error in
			if let error = error {
				print("Failed to load data \(error.localizedDescription)")
			}
		}
	}
	
	func save(context: NSManagedObjectContext) {
		do {
			try context.save()
			print("Data saved successfully")
		} catch {
			print("Data could not be saved")
		}
	}
	
	func addAssignment(name: String, pointValue: Double, context: NSManagedObjectContext) {
		let assignment = Assignment(context: context)
		assignment.id = UUID()
		assignment.name = name
		assignment.pointValue = pointValue
		
		save(context: context)
	}
}
