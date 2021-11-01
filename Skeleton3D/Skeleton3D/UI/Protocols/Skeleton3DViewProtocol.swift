//
//  Skeleton3DViewProtocol.swift
//  Skeleton3D
//
//  Created by Netanel Yerushalmi on 01/11/2021.
//

import SceneKit

protocol Skeleton3DViewProtocol{
    func drawBody(body:[SCNNode])
    func getScene() -> SCNScene
}
