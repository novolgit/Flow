////
////  SceneKitView.swift
////  Flow
////
////  Created by Vlad Novol on 17.01.2021.
////
//

import UIKit
import SceneKit
import SwiftUI

struct SceneKitView: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var constructorData: ConstructorData
    
    let sceneView = SCNView(frame: .zero)
    
    @Binding var modelsArray: Array<Any>
    @Binding var isDelete: Int
    @Binding var snapArray: Array<Any>
    @Binding var snapSet: Bool
    
    func makeUIView(context: Context) -> SCNView {
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = SCNScene()
//        sceneView.backgroundColor = (colorScheme == .dark ? UIColor(red:0.122, green:0.122 ,blue:0.122 , alpha: 1.00) : UIColor(red:0.878, green:0.878 ,blue:0.878 , alpha:1.00))
        
        let floor = SCNFloor()
        floor.firstMaterial!.colorBufferWriteMask = [.all]
        floor.firstMaterial!.readsFromDepthBuffer = true
        floor.firstMaterial!.writesToDepthBuffer = true
        floor.firstMaterial!.lightingModel = .constant
        
        let floorNode = SCNNode(geometry: floor)
        floorNode.position = SCNVector3(x: 0, y: -1, z: 0)
        sceneView.scene!.rootNode.addChildNode(floorNode)
        
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        var geometryNode = [SCNNode]()
        
        let tapGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
        
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
        if isDelete >= 1 {
            sceneView.scene?.rootNode.childNodes.filter(
                { $0.name == (modelsArray.last! as! String).replacingOccurrences(of: ".usdz", with: "")}
            ).forEach(
                { $0.removeFromParentNode() }
            )
        }
        print(modelsArray.count)
        
//        func snapStringArray() -> String {
        if snapSet {
            let snap = sceneView.snapshot()
//            let snapString = snap.toString()
//            let highresImage = SceneKitViewVar.asImage(size: imageSize)
            guard let highresData = snap.jpegData(compressionQuality: 1) else { return }
            constructorData.constructorImage.append(highresData)

            func saveImage(imageName: String, image: UIImage) {
                guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

                let fileName = imageName
                let fileURL = documentsDirectory.appendingPathComponent(fileName)
                guard let data = image.jpegData(compressionQuality: 1) else { return }

                //                                if FileManager.default.fileExists(atPath: fileURL.path) {
                //                                    do {
                //                                        try FileManager.default.removeItem(atPath: fileURL.path)
                //                                        print("Removed old image")
                //                                    } catch let removeError {
                //                                        print("couldn't remove file at path", removeError)
                //                                    }
                //                                }
                do {
                    try data.write(to: fileURL)
                } catch let error {
                    print("error saving file with error", error)
                }
                print("data \(data)")
                print("document \(documentsDirectory)")
            }

            //                            func saveImageIndex(data: Data) {
//        if snapSet {
            for index in constructorData.constructorImage.indices {
                saveImage(imageName: "constructorImage\(index).jpg", image: UIImage(data: constructorData.constructorImage[index]) ?? UIImage(named: "120x120_clear")!)
            }
            print("image counts: \(constructorData.constructorImage)")
            snapSet = false
//        }
            //                            }



            print("image counts: \(constructorData.constructorImage)")
            snapSet = false
        }
//            return snapString ?? ""
//        }
        
//        if snapSet {
//            snapArray.append(saveImage())
//            print("snapArrayUIKit \(snapArray)")
//        }
        
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(sceneView)
    }
    
    class Coordinator: NSObject {
        private let sceneView: SCNView
        init(_ sceneView: SCNView) {
            self.sceneView = sceneView
            super.init()
        }
        
        var PCoordx: Float = 0.0
        var PCoordz: Float = 0.0
        var PCoordy: Float = 0.0
        
        @objc func handleTap(_ gestureRecognize: UIPanGestureRecognizer) {
            guard let sceneView = sceneView as? SCNView else { return }
            let location = gestureRecognize.location(in: sceneView)
            switch gestureRecognize.state {
            case .began:
                let hitNodeResult = sceneView.hitTest(location, options: [:])
                if hitNodeResult.count == 1 {
                    let hitResult = hitNodeResult.first
                    self.PCoordx = hitResult?.worldCoordinates.x ?? 0
                    self.PCoordy = hitResult?.worldCoordinates.y ?? 0
                    self.PCoordz = hitResult?.worldCoordinates.z ?? 0
                }
            case .changed:
                let hitNode = sceneView.hitTest(gestureRecognize.location(in: sceneView), options: [:])
                if hitNode.count == 1 {
                    let hitTestResult = hitNode.first
                    if let coordx = hitNode.first?.worldCoordinates.x,
                       let coordy = hitNode.first?.worldCoordinates.y,
                       let coordz = hitNode.first?.worldCoordinates.z
                    {
                        let action = SCNAction.moveBy(x: CGFloat(coordx - self.PCoordx),
                                                      y: CGFloat(coordy - self.PCoordy),
                                                      z: CGFloat(coordz - self.PCoordz),
                                                      duration: 0.2)
                        hitTestResult?.node.runAction(action)
                        
                        self.PCoordx = coordx
                        self.PCoordy = coordy
                        self.PCoordz = coordz
                    }
                    
                    gestureRecognize.setTranslation(CGPoint.zero, in: sceneView)
                }
            case .ended:
                self.PCoordx = 0.0
                self.PCoordy = 0.0
                self.PCoordz = 0.0
            default:
                break
            }
        }
        
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
}
