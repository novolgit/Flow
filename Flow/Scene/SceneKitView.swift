////
////  SceneKitView.swift
////  Flow
////
////  Created by Vlad Novol on 17.01.2021.
////
//
////
////  GameViewController.swift
////  FlowTest3
////
////  Created by Vlad Novol on 17.01.2021.
////
//
//import UIKit
//import QuartzCore
//import SceneKit
//
//class SceneKitView : UIViewController, ObservableObject {
//    var geometryNode: SCNNode = SCNNode()
//
//    var lastPanLocation: SCNVector3?
//
//    var panStartZ: CGFloat?
//
//    var draggingNode: SCNNode?
//
//
//    override func loadView() {
//        view = SCNView()
//        let scene = SCNScene()
//        (view as! SCNView).scene = scene
//
//        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture(panGesture:)))
//        view.addGestureRecognizer(panRecognizer)
//
//        geometryNode = addBox(to: scene)
//    }
//    
//    @objc func panGesture(panGesture: UIPanGestureRecognizer) {
//        guard let view = view as? SCNView else { return }
//        let location = panGesture.location(in: self.view)
//        switch panGesture.state {
//        case .began:
//            guard let hitNodeResult = view.hitTest(location, options: nil).first else { return }
//            lastPanLocation = hitNodeResult.worldCoordinates
//            panStartZ = CGFloat(view.projectPoint(lastPanLocation!).z)
//            draggingNode = hitNodeResult.node
//        case .changed:
//            guard panStartZ != nil, draggingNode != nil else { return }
//
//            let worldTouchPosition = view.unprojectPoint(SCNVector3(location.x, location.y, panStartZ!))
//
//            let movementVector = SCNVector3(worldTouchPosition.x - lastPanLocation!.x,
//                                            worldTouchPosition.y - lastPanLocation!.y,
//                                            worldTouchPosition.z - lastPanLocation!.z)
//            geometryNode.localTranslate(by: movementVector)
//
//            self.lastPanLocation = worldTouchPosition
//        case .ended:
//            (panStartZ, draggingNode) = (nil, nil)
//
//        default:
//            break
//        }
//    }
//}
//
////    var PCoordx: Float = 0.0
////    var PCoordy: Float = 0.0
////    var PCoordz: Float = 0.0
////
////    @objc func handleDragGesture(sender: UIPanGestureRecognizer) {
////
////        switch sender.state {
////        case .began:
////            let hitNode = self.view.hitTest(sender.location(in: self.view),
////                                            options: nil).first
////            self.PCoordx = (hitNode.first?.worldCoordinates.x)!
////            self.PCoordy = (hitNode.first?.worldCoordinates.y)!
////            self.PCoordz = (hitNode.first?.worldCoordinates.z)!
////        case .changed:
////            // when you start to pan in screen with your finger
////            // hittest gives new coordinates of touched location in sceneView
////            // coord-pcoord gives distance to move or distance paned in sceneview
////            let hitNode = view.hitTest(sender.location(in: view), options: nil)
////            if let coordx = hitNode.first?.worldCoordinates.x,
////                let coordy = hitNode.first?.worldCoordinates.y,
////                let coordz = hitNode.first?.worldCoordinates.z {
////                let action = SCNAction.moveBy(x: CGFloat(coordx - PCoordx),
////                                              y: CGFloat(coordy - PCoordy),
////                                              z: CGFloat(coordz - PCoordz),
////                                              duration: 0.0)
////                self.photoNode.runAction(action)
////
////                self.PCoordx = coordx
////                self.PCoordy = coordy
////                self.PCoordz = coordz
////            }
////
////            sender.setTranslation(CGPoint.zero, in: self.view)
////        case .ended:
////            self.PCoordx = 0.0
////            self.PCoordy = 0.0
////            self.PCoordz = 0.0
////        default:
////            break
////        }
////    }
////}
//
//extension SceneKitView {
//    func addBox(to scene: SCNScene) -> SCNNode {
//        view.backgroundColor = .lightGray
//
//        let cube = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 1.0)
//        let cubeNode = SCNNode(geometry: cube)
//        let cubeContainer = SCNNode()
//        // cubeContainer will never be rotated, so we can easily translate it without rotation throwing us off.
//        cubeContainer.addChildNode(cubeNode)
//        cubeNode.worldTransform
//        cubeNode.rotate(by: .init(0.5, 0, 0, 1), aroundTarget: SCNVector3(-10, 10, 0))
//        scene.rootNode.addChildNode(cubeContainer)
//        
//        let cube1 = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 1.0)
//        let cubeNode1 = SCNNode(geometry: cube1)
//        let cubeContainer1 = SCNNode()
//        // cubeContainer will never be rotated, so we can easily translate it without rotation throwing us off.
//        cubeContainer.addChildNode(cubeNode1)
//        cubeNode1.worldTransform
//        cubeNode1.rotate(by: .init(0.5, 0.3, 0.6, 1), aroundTarget: SCNVector3(10, 10, 0))
//        scene.rootNode.addChildNode(cubeContainer1)
//        
////        let cube2 = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 1.0)
////        let cubeNode2 = SCNNode(geometry: cube2)
////        let cubeContainer2 = SCNNode()
////        // cubeContainer will never be rotated, so we can easily translate it without rotation throwing us off.
////        cubeContainer2.addChildNode(cubeNode2)
////        cubeNode2.worldTransform
////        cubeNode2.rotate(by: .init(0.5, 0, 0, 1), aroundTarget: SCNVector3(0, 0, 0))
////        scene.rootNode.addChildNode(cubeContainer2)
//        
//        let ambientLightNode = SCNNode()
//        ambientLightNode.light = SCNLight()
//        ambientLightNode.light!.type = .ambient
//        ambientLightNode.light!.color = UIColor(white: 0.4, alpha: 1.0)
//        scene.rootNode.addChildNode(ambientLightNode)
//
//        let omniLightNode = SCNNode()
//        omniLightNode.light = SCNLight()
//        omniLightNode.light!.type = .omni
//        omniLightNode.light!.color = UIColor(white: 0.5, alpha: 1.0)
//        omniLightNode.position = SCNVector3Make(0, 50, 50)
//        scene.rootNode.addChildNode(omniLightNode)
//
//
//        let cameraNode = SCNNode()
//        cameraNode.camera = SCNCamera()
//        cameraNode.position = SCNVector3Make(0, 0, 25)
//        scene.rootNode.addChildNode(cameraNode)
//
//        return cubeContainer
//
//    }
//}
//
