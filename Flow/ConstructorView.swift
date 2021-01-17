//
//  ConstructorView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI
import UIKit
import SceneKit

struct Model : Identifiable {
    
    var id : Int
    var name : String
    var modelName : String
    var details : String
}

//struct SceneKitView: UIViewRepresentable {
//    func makeUIView(context: UIViewRepresentableContext<SceneKitView>) -> SCNView {
//        let sceneView = SCNView()
//        sceneView.scene = SCNScene()
//        sceneView.allowsCameraControl = true
//        sceneView.autoenablesDefaultLighting = true
//
//        let subScene = SCNScene(named: "flower_tulip.usdz")!
//        let pyramid = subScene.rootNode.childNode(withName: "flower_tulip", recursively: true)!
//        sceneView.scene?.rootNode.addChildNode(pyramid)
//
//        return sceneView
//    }
//
//    func updateUIView(_ uiView: SCNView, context: UIViewRepresentableContext<SceneKitView>) {
//
//    }
//
//    typealias UIViewType = SCNView
//}

struct ConstructorView: View {
    @State private var showChoose = false
    
    @State var models = [
        
        Model(id: 1, name: "Earth", modelName: "Earth.usdz", details: "Earth is the third planet from the Sun and the only astronomical object known to harbor life. According to radiometric dating estimation and other evidence, Earth formed over 4.5 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, which is Earth's only natural satellite. Earth orbits around the Sun in 365.256 solar days."),
        
        Model(id: 2, name: "Jupiter", modelName: "Jupiter.usdz", details: "Jupiter is the largest planet in our solar system at nearly 11 times the size of Earth and 317 times its mass. Jupiter, being the biggest planet, gets its name from the king of the ancient Roman gods."),
        
        Model(id: 3, name: "Mars", modelName: "Mars.usdz", details: "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being only larger than Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the Red Planet."),
        
        Model(id: 4, name: "Pluto", modelName: "Pluto.usdz",details: "Pluto is an icy dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune. It was the first and the largest Kuiper belt object to be discovered. Pluto was discovered by Clyde Tombaugh in 1930 and declared to be the ninth planet from the Sun."),
        
        Model(id: 5, name: "Venus", modelName: "Venus.usdz",details: "Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. As the second-brightest natural object in the night sky after the Moon, Venus can cast shadows and can be, on rare occasion, visible to the naked eye in broad daylight."),
        Model(id: 6, name: "Flower", modelName: "flower_tulip.usdz",details: "Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. As the second-brightest natural object in the night sky after the Moon, Venus can cast shadows and can be, on rare occasion, visible to the naked eye in broad daylight."),
    ]
    
    @State var index = 0
    @State var modelList = ["flower_tulip.usdz"]
    
    
    let scene = SCNScene(named: "flower_tulip.usdz")
    
    @State private var exploding = false
    
    func createBox() -> SCNNode {
        let boxGeometry = SCNBox(width: 20, height: 24, length: 40, chamferRadius: 0)
        let box = SCNNode(geometry: boxGeometry)
        box.name = "box"
        return box
    }
    
//    @EnvironmentObject var scene: Scene
    
    var body: some View {
//        VStack {
//            SceneKitView()
//        }
        VStack {
            SceneView(
                    scene: scene,
                    pointOfView: createBox(),
                    options: [.autoenablesDefaultLighting,.allowsCameraControl]
            )
            Button(action: {
                exploding = !exploding
            }, label: {
                Text("Add")
            })
        }
//
//            HStack{
//                Text("1479$")
//                Spacer()
//                Button(action: {
//                    self.showChoose.toggle()
//                }) {
//                    Image(systemName: "chevron.up")
//                }
//                .sheet(isPresented: $showChoose, content: {
//                    VStack {
//                        HStack{
//                            Text("1479$")
//                            Spacer()
//                            Button(action: {
//                                self.showChoose.toggle()
//                            }) {
//                                Image(systemName: "chevron.down")
//                                    .foregroundColor(.red)
//                            }
//                        }
//                        .padding()
//                        Divider()
//                        ForEach(models){ modelFlower in
//                            VStack {
//                                HStack {
//                                    Text("\(modelFlower.name)")
//                                    Spacer()
//                                    Text("139$")
//                                    Button(action: {
//                                        addModel()
//                                        print(modelList)
//                                    }, label: {
//                                        Text("Add")
//                                    })
//                                }
//                                Divider()
//                            }
//                            .padding()
//                        }
//                        Spacer()
//                    }
//                    .background(Color(#colorLiteral(red: 0.5538704991, green: 0, blue: 0.245544076, alpha: 0.3176548434)))
//                })
//            }
//            .cornerRadius(20)
//            .padding()
//            .background(Color(#colorLiteral(red: 0.5538704991, green: 0, blue: 0.245544076, alpha: 0.3176548434)))
    }
//
//    func addModel() {
//        self.modelList.append(models[index].modelName)
//    }
}

struct ConstructorView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorView()
    }
}
