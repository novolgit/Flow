import SwiftUI


struct SettingsView: View {
    
    var accountName: String
    var accountPhone: String
//    var accountPassword: String
    
    var body: some View {
        ScrollView{
            VStack{
                NavigationLink(
                    destination: AccountSettingsView(accountName: accountName),
                    label: {
                        HStack{
                            Text("Name")
                                .font(.system(size: 20, design: .serif))
                                .foregroundColor(.gray)
                            Spacer()
                            HStack {
                                Text(accountName)
                                    .font(.system(size: 20, design: .serif))
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right.2")
                            }
                        }
                    })
                    .padding()
                    .frame(height: 70)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 15, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                        }
                    )
                NavigationLink(
                    destination: AccountSettingsView(accountName: accountName),
                    label: {
                        HStack{
                            Text("Email")
                                .font(.system(size: 20, design: .serif))
                                .foregroundColor(.gray)
                            Spacer()
                        HStack {
                        Text("mail")
                            .font(.system(size: 20, design: .serif))
                            .foregroundColor(.gray)
                            Image(systemName: "chevron.right.2")
                        }
                        }
                    })
                .padding()
                    .frame(height: 70)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 15, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                        }
                    )
                NavigationLink(
                    destination: AccountSettingsView(accountName: accountName),
                    label: {
                        HStack{
                            Text("Phone")
                                .font(.system(size: 20, design: .serif))
                                .foregroundColor(.gray)
                            Spacer()
                        HStack {
                        Text(accountPhone)
                            .font(.system(size: 20, design: .serif))
                            .foregroundColor(.gray)
                            Image(systemName: "chevron.right.2")
                        }
                        }
                    })
                .padding()
                    .frame(height: 70)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 15, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                        }
                    )
                NavigationLink(
                    destination: AccountSettingsView(accountName: accountName),
                    label: {
                        HStack{
                            Text("Password")
                                .font(.system(size: 20, design: .serif))
                                .foregroundColor(.gray)
                            Spacer()
                            Image(systemName: "chevron.right.2")
                        }
                    })
                .padding()
                    .frame(height: 70)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 15, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                        }
                    )
                NavigationLink(
                    destination: AccountSettingsView(accountName: accountName),
                    label: {
                        HStack{
                            Text("City")
                            Spacer()
                        HStack {
                        Text("accountCity")
                            .font(.system(size: 20, design: .serif))
                            .foregroundColor(.gray)
                            Image(systemName: "chevron.right.2")
                        }
                        }
                    })
                .padding()
                    .frame(height: 70)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 15, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                        }
                    )
            }
            .frame(width: UIScreen.main.bounds.width*0.90)
            .padding()
            .navigationBarTitle("Settings", displayMode: .inline)
        }
        .background(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
    }
}

struct SettingsView_Previews: PreviewProvider {

    static var previews: some View {
        SettingsView(accountName: "Vlad", accountPhone: "+712912382")
    }
}
  
//  struct FontPicker: UIViewControllerRepresentable {
//
//      // 2.
//      func makeUIViewController(context: Context) -> SceneKitView1 {
//        return SceneKitView1()
//      }
//
//      // 3.
//      func updateUIViewController(_ uiViewController: SceneKitView1, context: Context) {
//
//      }
//  }
//
//  class SceneKitView1 : UIViewController {
//      var geometryNode: SCNNode = SCNNode()
//
//      var lastPanLocation: SCNVector3?
//
//      var panStartZ: CGFloat?
//
//      var draggingNode: SCNNode?
//
//    let pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer()
//
//
//      override func loadView() {
//          view = SCNView()
//            let scene = SCNScene()
//          (view as! SCNView).scene = scene
//
//        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture(panGesture:)))
//          view.addGestureRecognizer(panRecognizer)
//
//        view.addGestureRecognizer(pinchGesture)
//        pinchGesture.addTarget(self, action: #selector(pinch))
////        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(zoom(gesture:)))
////        view.addGestureRecognizer(pinch)
//
//          geometryNode = addBox(to: scene)
//
//      }
//
//    @objc func pinch() {
//        guard let gestureView = pinchGesture.view else {
//            return
//        }
//        gestureView.transform = gestureView.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
//        pinchGesture.scale = 1
//    }
//
////      @objc func panGesture(panGesture: UIPanGestureRecognizer) {
////          guard let view = view as? SCNView else { return }
////          let location = panGesture.location(in: self.view)
////          switch panGesture.state {
////          case .began:
////              guard let hitNodeResult = view.hitTest(location, options: nil).first else { return }
////              lastPanLocation = hitNodeResult.worldCoordinates
////              panStartZ = CGFloat(view.projectPoint(lastPanLocation!).z)
////              draggingNode = hitNodeResult.node
////          case .changed:
////              guard panStartZ != nil, draggingNode != nil else { return }
////
////              let worldTouchPosition = view.unprojectPoint(SCNVector3(location.x, location.y, panStartZ!))
////
////              let movementVector = SCNVector3(worldTouchPosition.x - lastPanLocation!.x,
////                                              worldTouchPosition.y - lastPanLocation!.y,
////                                              worldTouchPosition.z - lastPanLocation!.z)
////              geometryNode.localTranslate(by: movementVector)
////
////              self.lastPanLocation = worldTouchPosition
////          case .ended:
////              (panStartZ, draggingNode) = (nil, nil)
////
////          default:
////              break
////          }
////      }
////  }
//
//
//
//    var PCoordx: Float = 0.0
//    var PCoordz: Float = 0.0
//    var PCoordy: Float = 0.0
//
//    @objc func panGesture(panGesture: UIPanGestureRecognizer) {
//        guard let view = view as? SCNView else { return }
//        let location = panGesture.location(in: self.view)
//        switch panGesture.state {
//        case .began:
//            guard let hitNodeResult = view.hitTest(location,
//                                                        options: nil).first else { return }
//            self.PCoordx = hitNodeResult.worldCoordinates.x
//            self.PCoordy = hitNodeResult.worldCoordinates.y
//            self.PCoordz = hitNodeResult.worldCoordinates.z
//        case .changed:
//            // when you start to pan in screen with your finger
//            // hittest gives new coordinates of touched location in sceneView
//            // coord-pcoord gives distance to move or distance paned in sceneview
//            let hitNode = view.hitTest(panGesture.location(in: view), options: nil)
//            if let coordx = hitNode.first?.worldCoordinates.x,
//                let coordy = hitNode.first?.worldCoordinates.y,
//                let coordz = hitNode.first?.worldCoordinates.z {
//                let action = SCNAction.moveBy(x: CGFloat(coordx - self.PCoordx),
//                                              y: CGFloat(coordy - self.PCoordy),
//                                              z: CGFloat(coordz - self.PCoordz),
//                                              duration: 0.0)
//                self.geometryNode.runAction(action)
//
//                self.PCoordx = coordx
//                self.PCoordy = coordy
//                self.PCoordz = coordz
//            }
//
//            panGesture.setTranslation(CGPoint.zero, in: self.view)
//        case .ended:
//            self.PCoordx = 0.0
//            self.PCoordy = 0.0
//            self.PCoordz = 0.0
//        default:
//            break
//        }
//    }
//
////    @objc func zoom(gesture: UIPinchGestureRecognizer) {
////        let view = self.view as! SCNView
////        let node = view.scene?.rootNode.childNode(withName: "Camera", recursively: false)
////        let scale = gesture.velocity
////
////        switch gesture.state {
////        case .began:
////            break
////        case .changed:
////            node.camera.fieldOfView = node.camera.fieldOfView - CGFloat(scale)
////            print(node!.camera!.fieldOfView)
////            break
////        default: break
////        }
////    }
//  }
//
//  extension SceneKitView1 {
//      func addBox(to scene: SCNScene) -> SCNNode {
//          view.backgroundColor = .lightGray
//
//          let cube = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 1.0)
//          let cubeNode = SCNNode(geometry: cube)
//          let cubeContainer = SCNNode()
//          // cubeContainer will never be rotated, so we can easily translate it without rotation throwing us off.
//          cubeContainer.addChildNode(cubeNode)
//          cubeNode.worldTransform
//          cubeNode.rotate(by: .init(0.5, 0, 0, 1), aroundTarget: SCNVector3(-10, 10, 0))
//          scene.rootNode.addChildNode(cubeContainer)
//
//          let cube1 = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 1.0)
//          let cubeNode1 = SCNNode(geometry: cube1)
//          let cubeContainer1 = SCNNode()
//          // cubeContainer will never be rotated, so we can easily translate it without rotation throwing us off.
//          cubeContainer.addChildNode(cubeNode1)
//          cubeNode1.worldTransform
//          cubeNode1.rotate(by: .init(0.5, 0.3, 0.6, 1), aroundTarget: SCNVector3(10, 10, 0))
//          scene.rootNode.addChildNode(cubeContainer1)
//
//
//  //        let cube2 = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 1.0)
//  //        let cubeNode2 = SCNNode(geometry: cube2)
//  //        let cubeContainer2 = SCNNode()
//  //        // cubeContainer will never be rotated, so we can easily translate it without rotation throwing us off.
//  //        cubeContainer2.addChildNode(cubeNode2)
//  //        cubeNode2.worldTransform
//  //        cubeNode2.rotate(by: .init(0.5, 0, 0, 1), aroundTarget: SCNVector3(0, 0, 0))
//  //        scene.rootNode.addChildNode(cubeContainer2)
//
//          let ambientLightNode = SCNNode()
//          ambientLightNode.light = SCNLight()
//          ambientLightNode.light!.type = .ambient
//          ambientLightNode.light!.color = UIColor(white: 0.4, alpha: 1.0)
//          scene.rootNode.addChildNode(ambientLightNode)
//
//          let omniLightNode = SCNNode()
//          omniLightNode.light = SCNLight()
//          omniLightNode.light!.type = .omni
//          omniLightNode.light!.color = UIColor(white: 0.5, alpha: 1.0)
//          omniLightNode.position = SCNVector3Make(0, 50, 50)
//          scene.rootNode.addChildNode(omniLightNode)
//
//
//          let cameraNode = SCNNode()
//          cameraNode.camera = SCNCamera()
//          cameraNode.position = SCNVector3Make(0, 0, 25)
//          scene.rootNode.addChildNode(cameraNode)
//
//          return cubeContainer
//
//      }
//  }
//
