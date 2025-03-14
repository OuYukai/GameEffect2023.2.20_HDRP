Shader "Hidden/StaticSwitchNode"
{
	Properties
	{
		_A ("_A", 2D) = "white" {}
		_B ("_B", 2D) = "white" {}
		_C ("_C", 2D) = "white" {}
		_D ("_D", 2D) = "white" {}
		_E ("_E", 2D) = "white" {}
		_F ("_F", 2D) = "white" {}
		_G ("_G", 2D) = "white" {}
		_H ("_H", 2D) = "white" {}
		_I ("_I", 2D) = "white" {}
	}
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#include "UnityCG.cginc"
			#include "Preview.cginc"
			#pragma vertex vert_img
			#pragma fragment frag

			sampler2D _A;
			sampler2D _B;
			sampler2D _C;
			sampler2D _D;
			sampler2D _E;
			sampler2D _F;
			sampler2D _G;
			sampler2D _H;
			sampler2D _I;
			int _Condition;

			float4 frag( v2f_img i ) : SV_Target
			{
				if( _Condition == 0)
					return tex2D( _B, i.uv ); // A nd B are switched
				else if( _Condition == 1 )
					return tex2D( _A, i.uv );
				else if( _Condition == 2 )
					return tex2D( _C, i.uv );
				else if( _Condition == 3 )
					return tex2D( _D, i.uv );
				else if( _Condition == 4 )
					return tex2D( _E, i.uv );
				else if( _Condition == 5 )
					return tex2D( _F, i.uv );
				else if( _Condition == 6 )
					return tex2D( _G, i.uv );
				else if( _Condition == 7 )
					return tex2D( _H, i.uv );
				else
					return tex2D( _I, i.uv );
			}
			ENDCG
		}
	}
}
