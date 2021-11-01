//
//  Skeleton.swift
//  Skeleton3D
//
//  Created by Netanel Yerushalmi on 01/11/2021.
//

import Foundation
import SceneKit

struct Skeleton{
    private var bodyParts:[SCNVector3]
    
    init(fromArray:[[Double]]){
        bodyParts = [SCNVector3]()
        for arr in fromArray{
            bodyParts.append(SCNVector3(arr[0], arr[1], arr[2]))
        }
    }
    
    func getSkeletonBody(scene:SCNScene) -> [SCNNode]{
        var body = [SCNNode]()
        body.append(contentsOf:getLeftLegLines(scene: scene))
        body.append(contentsOf:getRightLegLines(scene: scene))
        body.append(contentsOf:getSpineLines(scene: scene))
        body.append(contentsOf:getLeftArmLines(scene: scene))
        body.append(contentsOf:getRightArmLines(scene: scene))
        body.append(contentsOf:getHeadLines(scene: scene))
        return body
    }
    
    private func getLeftLegLines(scene:SCNScene) -> [SCNNode]{
        [
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[3], positionB: self.bodyParts[2],color: .blue, inScene: scene),
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[2], positionB: self.bodyParts[1],color: .blue, inScene: scene),
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[1], positionB: self.bodyParts[0],color: .blue, inScene: scene),
        ]
    }
    
    private func getRightLegLines(scene:SCNScene) -> [SCNNode]{
        [
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[6], positionB: self.bodyParts[5],color: .black, inScene: scene),
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[5], positionB: self.bodyParts[4],color: .black, inScene: scene),
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[4], positionB: self.bodyParts[0],color: .black, inScene: scene),
        ]
    }
    
    private func getSpineLines(scene:SCNScene) -> [SCNNode]{
        [
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[0], positionB: self.bodyParts[7],color: .green, inScene: scene),
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[7], positionB: self.bodyParts[8],color: .green, inScene: scene),
        ]
    }
    
    private func getLeftArmLines(scene:SCNScene) -> [SCNNode]{
        [
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[16], positionB: self.bodyParts[15],color: .yellow, inScene: scene),
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[15], positionB: self.bodyParts[14],color: .yellow, inScene: scene),
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[14], positionB: self.bodyParts[8],color: .yellow, inScene: scene),
        ]
    }
    
    private func getRightArmLines(scene:SCNScene) -> [SCNNode]{
        [
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[13], positionB: self.bodyParts[12],color: .brown, inScene: scene),
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[12], positionB: self.bodyParts[11],color: .brown, inScene: scene),
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[11], positionB: self.bodyParts[8],color: .brown, inScene: scene),
        ]
    }
    
    private func getHeadLines(scene:SCNScene) -> [SCNNode]{
        [
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[8], positionB: self.bodyParts[9], inScene: scene),
            SCNNode.lineBetweenNodes(positionA: self.bodyParts[9], positionB: self.bodyParts[10], inScene: scene),
        ]
    }
}
