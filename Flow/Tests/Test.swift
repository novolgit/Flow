//
//  Test.swift
//  Flow
//
//  Created by Vlad Novol on 01.02.2021.
//

import Foundation
import SwiftUI

struct Test: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var favoriteFlowers: FavoriteFlowers
    
    @State var favorites = UserDefaults.standard.value(forKey: "FavoriteFlowers") as? Array ?? []
    @State private var showFavoritesOnly = false

    var filteredFlowers: [Flower] {
        modelData.flowers.filter { flower in
            (!showFavoritesOnly || favoriteFlowers.contains(flower))
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredFlowers) { flower in
                    NavigationLink(destination: FlowerrDetail(flower: flower)) {
                        FlowerRow(flower: flower)
                    }
                }
            }
            .navigationTitle("Flowers")
        }
    }
}

struct FlowerRow: View {
    @EnvironmentObject var favoriteFlowers: FavoriteFlowers
    
    var flower: Flower

    var body: some View {
        HStack {
            Image(flower.image)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            Text(flower.name)

            Spacer()

            if favoriteFlowers.contains(flower) {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct FlowerrDetail: View {
    @EnvironmentObject var modelData: ModelData
    
    var flower: Flower

    var flowerIndex: Int {
        modelData.flowers.firstIndex(where: { $0.id == flower.id })!
    }

    var body: some View {
        ScrollView {

            VStack(alignment: .leading) {
                HStack {
                    Text(flower.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FlowerButton(isSet: $modelData.flowers[flowerIndex].isSelected, flower: flower)
                }

                HStack {
                    Text(flower.name)
                    Spacer()
                    Text(flower.descriptions)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(flower.name)")
                    .font(.title2)
                Text(String(flower.price))
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FlowerButton: View {
    @EnvironmentObject var favoriteFlowers: FavoriteFlowers
    
    @Binding var isSet: Bool
    
    var flower: Flower

    var body: some View {
        Button(action: {
            if favoriteFlowers.contains(flower) {
                favoriteFlowers.remove(flower)
                print(favoriteFlowers)
            } else {
                favoriteFlowers.add(flower)
                print(favoriteFlowers)
            }
        }) {
            Image(systemName: favoriteFlowers.contains(flower) ? "star.fill" : "star")
                .foregroundColor(favoriteFlowers.contains(flower) ? Color.yellow : Color.gray)
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
            .environmentObject(ModelData())
            .environmentObject(FavoriteFlowers())
    }
}
