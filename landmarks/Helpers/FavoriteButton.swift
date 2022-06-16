//
//  FavoriteButton.swift
//  landmarks
//
//  Created by yakir on 2022/6/14.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet :Bool
    
    var body: some View {
        
        Button{
            isSet.toggle()
        }label: {
            Label("Toggle Favorate",systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
