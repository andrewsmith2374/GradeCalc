//
//  AssignmentDetail.swift
//  GradeCalc
//
//  Created by Andrew Smith on 2023.07.15.
//

import SwiftUI

struct AssignmentDetail: View {
	@Environment (\.managedObjectContext) var managedObjContext
	@Environment(\.dismiss) var dismiss
	
	var assignment: FetchedResults<Assignment>.Element
	
	@State private var name: String = ""
	@State private var pointsReceived: Double = 90
	@State private var pointValue: Double = 100

    var body: some View {
		Form {
			HStack {
				TextField("Name:", text: $name)
					.textFieldStyle(.roundedBorder)
				Spacer()
				Text("Points:")
				HStack {
					TextField("", value: $pointsReceived, formatter: NumberFormatter())
						.frame(width: 60)
						.textFieldStyle(.roundedBorder)
					Text("/")
					TextField("", value: $pointValue, formatter: NumberFormatter())
						.frame(width: 60)
						.textFieldStyle(.roundedBorder)
				}
			}
		}
		.onAppear {
			name = assignment.name!
			pointsReceived = assignment.pointsReceived
			pointValue = assignment.pointValue
		}
		.padding()
    }
}
