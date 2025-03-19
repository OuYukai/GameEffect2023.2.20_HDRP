#ifndef SHADER_FUNCTIONS_INCLUDED
#define SHADER_FUNCTIONS_INCLUDED

float2 Panner(float2 texture_S, float2 uv, float2 speed, float time)
{
    uv += frac(texture_S * speed.xy * float2(time, time));
    return uv;
}

#endif