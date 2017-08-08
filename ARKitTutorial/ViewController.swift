//
//  ViewController.swift
//  ARKitTutorial
//
//  Created by Miyoshi Masataka on 2017/08/06.
//  Copyright © 2017年 Masataka Miyoshi. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    // Player Settingsの"Camera Usage Description"に何か文字列を入れる
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let configration = ARWorldTrackingSessionConfiguration()
        configration.planeDetection = .horizontal
        
        sceneView.session.run(configration)
    }
    
    func randomFloat(min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }

    // Cubeを追加する
    @IBAction func addCube(_ sender: Any) {
        
        // ノード作成
        let cubeNode = SCNNode()
        
        // 正方形の形（大きさ）を定義
        let cubeGeometry = SCNBox(width: 0.1, height: 0.1, length: 0, chamferRadius: 0)
        
        // ノードのgeometryに追加
        cubeNode.geometry = cubeGeometry
        
        
        let cc = getCameraCoordinates(sceneView: sceneView)
        
        cubeNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        sceneView.scene.rootNode.addChildNode(cubeNode)
        
        // 正方形の面で画像を表示
        //--------------------------------------------------------------------------------------------------------
        let cubeMaterial = SCNMaterial()
        
        // 画像の読み込み
        cubeMaterial.diffuse.contents = UIImage(named: "space-meigen")
        
        cubeGeometry.firstMaterial = cubeMaterial
    }
    
    @IBAction func addCup(_ sender: Any) {
    }
    
    struct myCameraCoordinates {
        var x = Float()
        var y = Float()
        var z = Float()
    }
    
    // 現在のカメラ（スマホ）の位置を取得
    func getCameraCoordinates(sceneView: ARSCNView) -> myCameraCoordinates {
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCoordinates = MDLTransform(matrix: cameraTransform!)
        
        var cc = myCameraCoordinates()
        cc.x = cameraCoordinates.translation.x
        cc.y = cameraCoordinates.translation.y
        cc.z = cameraCoordinates.translation.z
        
        return cc
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





