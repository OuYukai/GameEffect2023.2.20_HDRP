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
            
            Blend SrcAlpha One
            ZWrite Off
            
            HLSLPROGRAM
            
            #pragma vertex Vert
            #pragma fragment Frag

            sampler2D _MainTex;
            float4 _MainTex_ST;

            sampler2D _MaskTex;
            float4 _MaskTex_ST;

            float2 _MainTexSpeed;
            float2 _MaskTexSpeed;

            struct VertexInput
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct VertexOutput
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            VertexOutput Vert(VertexInput v)
            {
                VertexOutput o;
                o.vertex = TransformObjectToHClip(v.vertex);
                o.uv = v.uv;

                return o;
            }

            float4 Frag (VertexOutput i) : SV_Target
            {
                float4 col = tex2D(_MainTex, i.uv);

                return col;
            }
            ENDHLSL
        }
    }
}
