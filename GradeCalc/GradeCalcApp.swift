//
//  GradeCalcApp.swift
//  GradeCalc
//
//  Created by Andrew Smith on 2023.07.15.
//

import SwiftUI

@main
struct GradeCalcApp: App {
	@StateObject private var dataController = DataController()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
