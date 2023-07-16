//
//  AddAssignment.swift
//  GradeCalc
//
//  Created by Andrew Smith on 2023.07.15.
//

import SwiftUI

struct AddAssignment: View {
	@Environment (\.managedObjectContext) var managedObjContext
	@Environment(\.dismiss) var dismiss
	
	@State private var name: String = ""
	@State private var pointValue: Double = 100
	
    var body: some View {
		Form {
			Section {
				TextField("Name", text: $name)
				
				HStack {
					Text("Points")
					TextField("", value: $pointValue, formatter: NumberFormatter())
						.frame(width: 50)
					Stepper(value: $pointValue, in: 1...255) {
						EmptyView()
					}
				}
			}
		}
		.padding()
		
		HStack {
			Spacer()
			Button("Submit") {
				DataController().addAssignment(name: name, pointValue: pointValue, context: managedObjContext)
				dismiss()
			}
			Spacer()
		}
    }
}

struct AddAssignment_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignment()
    }
}
