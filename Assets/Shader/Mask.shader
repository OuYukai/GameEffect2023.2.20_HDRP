Shader "FromASE/Mask"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _MaskTex ("Texture", 2D) = "white" {}
        _MainTexSpeed("MainTexSpeed", Vector) = (0,0,0,0)
        _MaskTexSpeed("MainTexSpeed", Vector) = (0,0,0,0)
    }
    SubShader
    {
        Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Transparent" "Queue"="Transparent"}
        LOD 100

        HLSLINCLUDE

        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"
		#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
        
        ENDHLSL

        Pass
        {
            Name "Forward Unlit"
            Tags { "LightMode" = "ForwardOnly" }
            
            Blend One One
            ZWrite Off
            
            HLSLPROGRAM

            
            
            ENDHLSL
        }
    }
}
