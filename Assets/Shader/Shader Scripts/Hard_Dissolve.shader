Shader "ShaderResearch/Hard_Dissolve"
{
    Properties
    {
        _MainTex ("Main Tex", 2D) = "white" {}
        _NoiseTex("Noise Tex", 2D) = "White" {}
        _Progress("Progress", Range( 0 , 1.05)) = 1
    }
    
    SubShader
    {
        Tags { "RenderPipeline" = "HDRenderPipeline" "RenderType" = "Transparent" "Queue"="Transparent" }

        Blend SrcAlpha OneMinusSrcAlpha
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

            float4 _MainTex_ST;
            float4 _NoiseTex_ST;
            float _Progress;

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
                float4 mainTexColor = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, input.uv_MainTex);
                float4 noiseTexColor= SAMPLE_TEXTURE2D(_NoiseTex, sampler_NoiseTex, input.uv_NoiseTex);

                float alpha = step(_Progress, noiseTexColor.r) * mainTexColor.a;

                return float4(mainTexColor.rgb, alpha);
            }
            
            ENDHLSL
        }
    }
}