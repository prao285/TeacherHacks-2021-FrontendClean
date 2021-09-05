//
//  AttendenceReportView.swift
//  AttendEase (iOS)
//
//  Created by Brysen Reeser on 9/4/21.
//

import SwiftUI

struct AttendenceReportView: View {
    var missingGroup = ["one", "two"]
    var attendingGroup = ["three", "Four"]
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "ellipsis")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height:10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                Spacer()
                Text("Attendance")
                    .font(.system(size: 64, weight: .medium, design: .default))
                    .underline()
                Spacer()
            }
            
            HStack {
                Text("Missing")
                    .font(.system(size: 40, weight: .medium, design: .default))
                    .underline()
                    .padding(.leading, 50)
                    .padding(.bottom, 30)
                    .padding(.top, 40)
                Spacer()
                Text("In Attendence")
                    .font(.system(size: 40, weight: .medium, design: .default))
                    .underline()
                    .padding(.trailing, 50)
                
            }
            HStack {
                List {
                    ForEach(self.missingGroup, id: \.self) { item in
                        Text(item)
                    }
                    Button(action: {
                        //Enter functionality here if we take this approach
                    }) {
                        Text("Edit")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
                Spacer()
                List{
                    ForEach(self.attendingGroup, id: \.self) { item in
                        HStack{
                            Text(item)
                            Button(action: {
                                
                            }) {
                                Text("Swap")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

struct AttendenceReportView_Previews: PreviewProvider {
    static var previews: some View {
        AttendenceReportView()
    }
}
