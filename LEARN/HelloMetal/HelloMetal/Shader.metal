//
//  Shader.metal
//  HelloMetal
//
//  Created by Ivo Stoyanov on 1/11/15.
//  Copyright (c) 2015 s1nn. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;


// vertex shader - called for each vertex
// must return (at least) the final position of the vertex
vertex float4 basic_vertex(
       const device packed_float3* vertex_array [[ buffer(0) ]],
       unsigned int vid [[ vertex_id ]])
{
    // same position
    return float4(vertex_array[vid], 1.0);
}

// fragment shader - called for each pixel
// must return (at least) the final color of the fragment

fragment half4 basic_fragment() { // 1
    return half4(1.0);              // white color
}
