//
//  LandmarkList.swift
//  landmarks
//
//  Created by yakir on 2022/6/13.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData:ModelData
    @State private var showFavoritesOnly = false
    
    @State private var title = ""
    var filteredLandmarks:[Landmark]{
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly||landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
           
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("只看收藏")
                        .foregroundColor(Color.pink)
                }
                ForEach(filteredLandmarks){  landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
            .previewDevice("iPhone 13 mini")
    }
}
