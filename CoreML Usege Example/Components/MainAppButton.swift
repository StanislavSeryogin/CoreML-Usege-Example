//
//  File.swift
//  
//
//  Created by Stanislav Seryogin on 28.08.2023.
//

import SwiftUI

struct MainAppButton: View {
    let title: String

    var body: some View {
           Text(title)
               .padding()
               .background(Color.blue)
               .foregroundColor(.white)
               .cornerRadius(8)
       }
}
