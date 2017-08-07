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

    // Cubeを追加する
    @IBAction func addCube(_ sender: Any) {
        let cubeNode = SCNNode()
        let cubeGeometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        cubeNode.geometry = cubeGeometry
        
        cubeNode.position = SCNVector3(0, 0, 0.5)
        sceneView.scene.rootNode.addChildNode(cubeNode)
    }
    
    @IBAction func addCup(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

