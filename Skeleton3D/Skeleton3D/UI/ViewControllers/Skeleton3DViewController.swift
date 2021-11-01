//
//  Skeleton3DViewController.swift
//  Skeleton3D
//
//  Created by Netanel Yerushalmi on 01/11/2021.
//

import UIKit
import SceneKit

class Skeleton3DViewController: UIViewController {

    private let scene = SCNScene()
    private let cameraNode = SCNNode()
    private var presenter:Skeleton3DPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = Skeleton3DPresenter(view: self)
    }
    
    override func loadView() {
        let sceneView = SCNView(frame: CGRect(x: 10, y: 0, width: 500, height: 500))
        sceneView.scene = scene
        
        sceneView.autoenablesDefaultLighting = true

        // a camera
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: -5)
        cameraNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: .pi)
        scene.rootNode.addChildNode(cameraNode)
        
        view = sceneView
    }
}

extension Skeleton3DViewController:Skeleton3DViewProtocol{
    func drawBody(body: [SCNNode]) {
        for bodyPart in body {
            scene.rootNode.addChildNode(bodyPart)
        }
    }
    
    func getScene() -> SCNScene {
        scene
    }
}
