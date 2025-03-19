Shader "ShaderResearch/Mask"
{
    Properties
    {
        [HDR]_MainColor ("Base Color", Color) = (1, 1, 1, 1)
        
        _MainTex ("Main Tex", 2D) = "white" {}
        _MainTexSpeed("MainTexSpeed", Vector) = (0,0,0,0)
        _NoiseTex ("Noise Tex", 2D) = "white" {}
        _NoiseTexSpeed("MaskTexSpeed", Vector) = (0,0,0,0)
    }

    SubShader
    {
        Tags { "RenderPipeline" = "HDRenderPipeline" "RenderType" = "Transparent" "Queue"="Transparent"}

        Blend One One
        ZWrite Off
        
        Pass
        {
            Name "ForwardOnly"
            Tags { "LightMode"="ForwardOnly" }

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"

            #include "Assets/Shader/Shader Scripts/ShaderLibrary/ShaderFunctions.hlsl"
            
            //CBUFFER_START(UnityPerMaterial)
            float4 _MainColor;
            float4 _MainTex_ST;
            float2 _MainTexSpeed;
            float4 _NoiseTex_ST;
            float2 _NoiseTexSpeed;
            //CBUFFER_END
            
            TEXTURE2D(_MainTex);
            SAMPLER(sampler_MainTex);
            TEXTURE2D(_NoiseTex);
            SAMPLER(sampler_NoiseTex);
            
            struct Attributes
            {
                float4 positionOS : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
                float2 uv_MainTex : TEXCOORD0;
                float2 uv_NoiseTex: TEXCOORD1;
            };

            Varyings vert(Attributes input)
            {
                Varyings output;
                output.positionCS = TransformObjectToHClip(input.positionOS.xyz);
                output.uv_MainTex = TRANSFORM_TEX(input.uv, _MainTex);
                output.uv_NoiseTex= TRANSFORM_TEX(input.uv, _NoiseTex);
                
                return output;
            }
            
            float4 frag(Varyings input) : SV_Target
            {
                input.uv_MainTex = Panner(_MainTex_ST.xy, input.uv_MainTex, _MainTexSpeed, _Time.y);
                input.uv_NoiseTex= Panner(_NoiseTex_ST.xy, input.uv_NoiseTex, _NoiseTexSpeed, _Time.y);
                
                float4 texColor = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, input.uv_MainTex);
                float4 noiseColor = SAMPLE_TEXTURE2D(_NoiseTex, sampler_NoiseTex, input.uv_NoiseTex);
                
                float4 finalColor = texColor * _MainColor * noiseColor;
                
                return finalColor;
            }

            ENDHLSL
        }
    }
}