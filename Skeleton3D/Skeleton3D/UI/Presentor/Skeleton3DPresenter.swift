//
//  Skeleton3DPresenter.swift
//  Skeleton3D
//
//  Created by Netanel Yerushalmi on 01/11/2021.
//

import SceneKit

class Skeleton3DPresenter:Skeleton3DPresenterProtocol{
    
    private let view:Skeleton3DViewProtocol
    private var skeltons = [Skeleton]()
    private var currentBody = [SCNNode]()
    private var index = 0
    
    required init(view: Skeleton3DViewProtocol) {
        self.view = view
        getSkeletonArray()
        Timer.scheduledTimer(timeInterval: 1/30, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
    }
    
    @objc func handleTimer(){
        self.index = (index + 1) % skeltons.count
        self.removeBody()
        self.currentBody = skeltons[index].getSkeletonBody(scene: self.view.getScene())
        self.view.drawBody(body: currentBody)
    }
    
    private func removeBody() {
        for current in currentBody {
            current.removeFromParentNode()
        }
        currentBody.removeAll()
    }
    
    func getSkeletonArray(){
        guard let jsonData = JSONReader<[[[Double]]]>.readJSON(jsonName: "three_d_skeleton") else {return}
        for arr in jsonData{
            skeltons.append(Skeleton(fromArray: arr))
        }
    }
}
