//
//  YourClassView.swift
//  Attendease
//
//  Created by Brysen Reeser on 9/4/21.
//

import SwiftUI

struct YourClassView: View {
    
    @State var classList = ["A", "SAD", "SDAFEWQ"]
    var body: some View {
        
        VStack {
            Text("Classes")
                .font(.system(size: 64, weight: .medium, design: .default))
                .underline()
                .bold()
            List {
                ForEach(self.classList, id: \.self) { item in
                    HStack{
                        Text(item)
                        NavigationLink(destination: QRScannerView(), label: {
                            Text("Start Attendance")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        })
                    }
                } 
            }
        }
        
       
    }
    
    
    struct YourClassView_Previews: PreviewProvider {
        static var previews: some View {
            YourClassView()
        }
    }
}
