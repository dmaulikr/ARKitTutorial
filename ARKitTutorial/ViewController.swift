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
        // ランダムでx,y,z軸の位置を決定
//        let xCoords = randomFloat(min: -1, max: -0.2)
//        let yCoords = randomFloat(min: -1, max: -0.2)
//        let zCoords = randomFloat(min: -1, max: -0.2)
        
        // ノード作成
        let cubeNode = SCNNode()
        // 正方形の形を定義
        let cubeGeometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        // ノードのgeometryに追加
        cubeNode.geometry = cubeGeometry
        
//        cubeNode.position = SCNVector3(xCoords, yCoords, zCoords)
        
        sceneView.scene.rootNode.addChildNode(cubeNode)
        
        //----------------------------------------------------
        let cubeMaterial = SCNMaterial()
        
        // cubeMaterial.diffuse.contents = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
        // 画像の読み込み
        cubeMaterial.diffuse.contents = UIImage(named: "popstar")
        
        cubeGeometry.firstMaterial = cubeMaterial
        //----------------------------------------------------
    }
    
    @IBAction func addCup(_ sender: Any) {
    }
    
    struct myCameraCoordinates {
        var x = Float()
        var y = Float()
        var z = Float()
    }
    
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





