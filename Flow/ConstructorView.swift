//
//  ConstructorView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI
import UIKit
import SceneKit

struct ConstructorView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showChoose = false
    @State private var show: Bool = false
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State var modelsArray: Array<Any> = []
    @State var isDelete: Int = 0
    
    @Namespace private var namespace 
    
    let imageSize: CGSize = CGSize(width: 1000, height: 1000)
    
    var body: some View {
        //        GeometryReader { geometry in
        VStack{
            ZStack{
                SceneKitView(modelsArray: $modelsArray, isDelete: $isDelete)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Button(action: {
                            modelsArray.removeLast()
                            isDelete += 1
                        }, label: {
                            Image(systemName: "trash")
                            //                                .resizable()
                            //                                .frame(width: 30, height: 30)
                        })
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "arrowshape.turn.up.left")
                            //                                .resizable()
                            //                                .frame(width: 30, height: 30)
                        })
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "square.and.arrow.up")
                            //                                .resizable()
                            //                                .frame(width: 30, height: 30)
                        })
                        Button(action: {
                            //                            _ = SceneKitView().asImage(size: imageSize)
                        }, label: {
                            Image(systemName: "cart.badge.plus")
                            //                                .resizable()
                            //                                .frame(width: 30, height: 30)
                        })
                    }
                    .padding()
                    Spacer()
                }
            }
            VStack{
                if !show {Button(action: {
                    //                    withAnimation(.spring()) {
                    show.toggle()
                    
                    //                    }
                }, label: {
                    Image(systemName: "chevron.compact.up")
                        .resizable()
                        .frame(width: 30, height: 10)
                        .padding(8)
                        .matchedGeometryEffect(id: "ConstructorCapsule", in: self.namespace)
                })
                } else {
                    VStack{
                        Capsule()
                            .frame(width: 50, height: 5)
                            .foregroundColor(.gray)
                            .padding()
                            .matchedGeometryEffect(id: "ConstructorCapsule", in: self.namespace)
                            .onTapGesture {
                                //                                withAnimation(.spring()) {
                                show.toggle()
                                
                                //                                }
                            }
                        HStack{
                            HStack {
                                Image(systemName: "magnifyingglass")
                                
                                TextField("search", text: $searchText, onEditingChanged: { isEditing in
                                    self.showCancelButton = true
                                }, onCommit: {
                                    print("onCommit")
                                }).foregroundColor(.primary)
                                
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                                }
                            }
                            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                            .foregroundColor(.secondary)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10.0)
                            
                            if showCancelButton  {
                                Button("Cancel") {
                                    UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                    self.searchText = ""
                                    self.showCancelButton = false
                                }
                                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                                .foregroundColor(Color(.systemBlue))
                            }
                        }
                        .padding(.horizontal)
                        .navigationBarHidden(showCancelButton)
                        //                .animation(.spring())
                    }
                }
                if !show {ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 0) {
                        ForEach(modelData.models) {model in
                            VStack {
                                Text(model.name)
                                HStack{
                                    Image(model.image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    Button(action: {
                                        modelsArray.append(model.image + ".usdz")
                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                        impactMed.impactOccurred()
                                    }, label: {
                                        Image(systemName: "plus.app")
                                    })
                                }
                            }
                            .frame(width: 80, height: 80)
                            .padding()
                        }
                    }
                }
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(modelData.models) {model in
                            HStack {
                                Image(model.image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                Spacer()
                                VStack{
                                    Text("Name")
                                    Text(model.name)
                                }
                                Button(action: {
                                    modelsArray.append(model.image + ".usdz")
                                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                    impactMed.impactOccurred()
                                }, label: {
                                    Image(systemName: "plus.app")
                                })
                            }
                            .padding()
                        }
                    }
                    .frame(height: 500)
                }
            }
            .background(
                Group {
                    NeuButtonsView2(radius: 25, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                }
            )
            .padding()
        }
    }
}

struct ConstructorView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorView()
            .environmentObject(ModelData())
    }
}

struct SceneKitView: UIViewRepresentable {
    
    let sceneView = SCNView(frame: .zero)
    
    @Binding var modelsArray: Array<Any>
    
    @Binding var isDelete: Int
    
    func makeUIView(context: Context) -> SCNView {
        
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = SCNScene()
        
        //        for model in modelsArray {
        //            let scene = SCNScene(named: model as! String)!
        //
        //            let earthNode = scene.rootNode.childNode(withName: (model as! String).replacingOccurrences(of: ".usdz", with: ""), recursively: false)!
        //            earthNode.position.x = -100
        //            geometryNode.append(earthNode as SCNNode)
        //            sceneView.scene?.rootNode.addChildNode(geometryNode.last!)
        //        }
        
        //        let starButton = UIButton(type: UIButton.ButtonType.custom)
        //        starButton.frame = CGRect(x: 10, y: 60, width: 30, height: 30)
        //        starButton.backgroundColor = .blue
        //        sceneView.addSubview(starButton)
        ////
        //        let tapGestureDelete = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.gestureRecognizer(_:)))
        //        sceneView.addGestureRecognizer(tapGestureDelete)
        //        starButton.adjustsImageWhenHighlighted = false
        
        let floor = SCNFloor()
        floor.firstMaterial!.colorBufferWriteMask = [.all]
        floor.firstMaterial!.readsFromDepthBuffer = true
        floor.firstMaterial!.writesToDepthBuffer = true
        floor.firstMaterial!.lightingModel = .constant
        
        let floorNode = SCNNode(geometry: floor)
        floorNode.position = SCNVector3(x: 0, y: -1, z: 0)
        sceneView.scene!.rootNode.addChildNode(floorNode)
        
        
        //        let tapGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        //        sceneView.addGestureRecognizer(tapGesture)
        
        return sceneView
    }
    func updateUIView(_ uiView: SCNView, context: Context) {
        var geometryNode = [SCNNode]()
        
        if modelsArray.count == 0 {
            for model in modelsArray {
            let scene = SCNScene(named: model as! String)!
            
            let sceneNode = scene.rootNode.childNode(withName: (model as! String).replacingOccurrences(of: ".usdz", with: ""), recursively: false)!
//            sceneNode.position.x = -30 * Float(modelsArray.count)
            geometryNode.append(sceneNode as SCNNode)
            sceneView.scene?.rootNode.addChildNode(geometryNode.last!)
        }
        } else {
        let scene = SCNScene(named: modelsArray.last! as! String)!
        
        let sceneNode = scene.rootNode.childNode(withName: (modelsArray.last! as! String).replacingOccurrences(of: ".usdz", with: ""), recursively: false)!
        sceneNode.position.x = -30 * Float(modelsArray.count)
        geometryNode.append(sceneNode as SCNNode)
        sceneView.scene?.rootNode.addChildNode(geometryNode.last!)
        }
//        if isDelete == 1 {
//            geometryNode.last!.removeFromParentNode()
//        }
        if isDelete >= 1 {
        sceneView.scene?.rootNode.childNodes.filter(
            { $0.name == (modelsArray.last! as! String).replacingOccurrences(of: ".usdz", with: "")}
        ).forEach(
            { $0.removeFromParentNode() }
        )
        }
        
        print("Array: "+String(modelsArray.count))
        print(sceneView.scene?.rootNode.childNodes.count)
        print("isDelete taps: "+String(isDelete))
    }
    //
    //        func makeCoordinator() -> Coordinator {
    //            Coordinator(sceneView, modelsArray)
    //        }
    //
    //        class Coordinator: NSObject {
    //            private let sceneView: SCNView
    //            private var modelsArray: Array<Any>
    //            init(_ sceneView: SCNView, _ modelsArray: Array<Any>) {
    //                self.sceneView = sceneView
    //                self.modelsArray = modelsArray
    //                super.init()
    //            }
    //
    //            @objc func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
    //                    modelsArray.append("tv_retro.usdz")
    //            }
    //        }
    
    //        var PCoordx: Float = 0.0
    //        var PCoordz: Float = 0.0
    //        var PCoordy: Float = 0.0
    //
    //        @objc func handleTap(_ gestureRecognize: UIPanGestureRecognizer) {
    //            guard let view = view as? SCNView else { return }
    //            let location = gestureRecognize.location(in: self.view)
    //            switch gestureRecognize.state {
    //            case .began:
    //                guard let hitNodeResult = view.hitTest(location,
    //                                                       options: [:]).first else { return }
    //                self.PCoordx = hitNodeResult.worldCoordinates.x
    //                self.PCoordy = hitNodeResult.worldCoordinates.y
    //                self.PCoordz = hitNodeResult.worldCoordinates.z
    //            case .changed:
    //                let hitNode = view.hitTest(gestureRecognize.location(in: view), options: [:])
    //                if let coordx = hitNode.first?.worldCoordinates.x,
    //                   let coordy = hitNode.first?.worldCoordinates.y,
    //                   let coordz = hitNode.first?.worldCoordinates.z {
    //                    let action = SCNAction.moveBy(x: CGFloat(coordx - self.PCoordx),
    //                                                  y: CGFloat(coordy - self.PCoordy),
    //                                                  z: CGFloat(coordz - self.PCoordz),
    //                                                  duration: 0.0)
    //                    self.geometryNode.runAction(action)
    //
    //                    self.PCoordx = coordx
    //                    self.PCoordy = coordy
    //                    self.PCoordz = coordz
    //                }
    //
    //                gestureRecognize.setTranslation(CGPoint.zero, in: self.view)
    //            case .ended:
    //                self.PCoordx = 0.0
    //                self.PCoordy = 0.0
    //                self.PCoordz = 0.0
    //            default:
    //                break
    //            }
    //        }
    
    //        @objc func handleTap(_ gestureRecognize: UIGestureRecognizer) {
    //            // check what nodes are tapped
    //            let p = gestureRecognize.location(in: view)
    //            let hitResults = view.hitTest(p, options: [:])
    //
    //            // check that we clicked on at least one object
    //            if hitResults.count > 0 {
    //
    //                // retrieved the first clicked object
    //                let result = hitResults[0]
    //
    //                // get material for selected geometry element
    //                let material = result.node.geometry!.materials[(result.geometryIndex)]
    //
    //                // highlight it
    //                SCNTransaction.begin()
    //                SCNTransaction.animationDuration = 0.5
    //
    //                // on completion - unhighlight
    //                SCNTransaction.completionBlock = {
    //                    SCNTransaction.begin()
    //                    SCNTransaction.animationDuration = 0.5
    //
    //                    material.emission.contents = UIColor.black
    //
    //                    SCNTransaction.commit()
    //                }
    //                material.emission.contents = UIColor.green
    //                SCNTransaction.commit()
    //            }
    //        }
    //    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
