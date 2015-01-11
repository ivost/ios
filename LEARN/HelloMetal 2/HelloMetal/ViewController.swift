//
//  ViewController.swift
//  HelloMetal
//
//  Created by Main Account on 10/2/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit
import Metal
import QuartzCore

class ViewController: UIViewController {

  var device: MTLDevice! = nil
  var metalLayer: CAMetalLayer! = nil
  var objectToDraw: Triangle!
  var pipelineState: MTLRenderPipelineState! = nil
  var commandQueue: MTLCommandQueue! = nil
  var timer: CADisplayLink! = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    device = MTLCreateSystemDefaultDevice()
    metalLayer = CAMetalLayer()          // 1
    metalLayer.device = device           // 2
    metalLayer.pixelFormat = .BGRA8Unorm // 3
    metalLayer.framebufferOnly = true    // 4
    metalLayer.frame = view.layer.frame  // 5
    view.layer.addSublayer(metalLayer)   // 6
    
    objectToDraw = Triangle(device: device)
    
    commandQueue = device.newCommandQueue()
    
    // 1
    let defaultLibrary = device.newDefaultLibrary()
    let fragmentProgram = defaultLibrary!.newFunctionWithName("basic_fragment")
    let vertexProgram = defaultLibrary!.newFunctionWithName("basic_vertex")
     
    // 2
    let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
    pipelineStateDescriptor.vertexFunction = vertexProgram
    pipelineStateDescriptor.fragmentFunction = fragmentProgram
    pipelineStateDescriptor.colorAttachments[0].pixelFormat = .BGRA8Unorm
     
    // 3
    var pipelineError : NSError?
    pipelineState = device.newRenderPipelineStateWithDescriptor(pipelineStateDescriptor, error: &pipelineError)
    if pipelineState == nil {
      println("Failed to create pipeline state, error \(pipelineError)")
    }    
    
    timer = CADisplayLink(target: self, selector: Selector("gameloop"))
    timer.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func render() {
    var drawable = metalLayer.nextDrawable()
    objectToDraw.render(commandQueue, pipelineState: pipelineState, drawable: drawable, clearColor: nil)
  }
   
  func gameloop() {
    autoreleasepool {
      self.render()
    }
  }

}

