//
//  ViewController.swift
//  HelloMetal
//
//  http://www.raywenderlich.com/77488/ios-8-metal-tutorial-swift-getting-started
//
//  Created by Ivo Stoyanov on 1/11/15.
//  Copyright (c) 2015 s1nn. All rights reserved.
//

import UIKit
import Metal
import QuartzCore

class ViewController: UIViewController {

    var device: MTLDevice! = nil
    var metalLayer: CAMetalLayer! = nil
    var vertexBuffer: MTLBuffer! = nil
    var pipelineState: MTLRenderPipelineState! = nil
    var commandQueue: MTLCommandQueue! = nil
    var timer: CADisplayLink! = nil
    
    // triangle
    let vertexData:[Float] = [
        0.0, 1.0, 0.0,
        -1.0, -1.0, 0.0,
        1.0, -1.0, 0.0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        device = MTLCreateSystemDefaultDevice()
        metalLayer = CAMetalLayer()          // 1
        metalLayer.device = device           // 2
        metalLayer.pixelFormat = .BGRA8Unorm // 8 bytes for Blue, Green, Red, and Alpha, in that order – with normalized values between 0 and 1
        metalLayer.framebufferOnly = true    // 4
        metalLayer.frame = view.layer.frame  // 5
        view.layer.addSublayer(metalLayer)   // 6
        
        let dataSize = vertexData.count * sizeofValue(vertexData[0]) // 1
        vertexBuffer = device.newBufferWithBytes(vertexData, length: dataSize, options: nil) // 2
  
        // 1
        let defaultLibrary = device.newDefaultLibrary()
        let fragmentProgram = defaultLibrary!.newFunctionWithName("basic_fragment")
        let vertexProgram = defaultLibrary!.newFunctionWithName("basic_vertex")
        
        // 2
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexProgram
        pipelineStateDescriptor.fragmentFunction = fragmentProgram
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .BGRA8Unorm
        
        var pipelineError : NSError?
        pipelineState = device.newRenderPipelineStateWithDescriptor(pipelineStateDescriptor, error: &pipelineError)
        if pipelineState == nil {
            println("Failed to create pipeline state, error \(pipelineError)")
        }
        
        // create command queue
        commandQueue = device.newCommandQueue()
        
        // create display link
        timer = CADisplayLink(target: self, selector: Selector("gameloop"))
        timer.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        
    }
    
    // called on each frame
    func render() {
        let desc = MTLRenderPassDescriptor()
        let drawable = metalLayer.nextDrawable()
        desc.colorAttachments[0].texture = drawable.texture
        desc.colorAttachments[0].loadAction = .Clear
        desc.colorAttachments[0].clearColor = MTLClearColor(red: 0.0, green: 20.0/255.0, blue: 150.0/255.0, alpha: 0.7)
        
        // create command buffer
        let commands = commandQueue.commandBuffer()
        let encoderOpt = commands.renderCommandEncoderWithDescriptor(desc)
        if let encoder = encoderOpt {
            encoder.setRenderPipelineState(pipelineState)
            encoder.setVertexBuffer(vertexBuffer, offset: 0, atIndex: 0)
            encoder.drawPrimitives(.Triangle, vertexStart:0, vertexCount: 3, instanceCount: 1)
            encoder.endEncoding()
        }
        
        commands.presentDrawable(drawable)
        commands.commit()
    }
    
    func gameloop() {
        autoreleasepool {
            self.render()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

