// Amplify Shader Editor - Visual Shader Editing Tool
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>

using System;

namespace AmplifyShaderEditor
{
	[Serializable]
	[NodeAttributes( "Primitive ID", "Vertex Data", "Per-primitive identifier automatically generated by the runtime" )]
	public class PrimitiveIDVariableNode : ParentNode
	{
		protected override void CommonInit( int uniqueId )
		{
			base.CommonInit( uniqueId );
			AddOutputPort( WirePortDataType.INT, "Out" );
			m_previewShaderGUID = "92c1b588d7658594cb219696f593f64b";
		}

		public override string GenerateShaderForOutput( int outputId, ref MasterNodeDataCollector dataCollector, bool ignoreLocalvar )
		{
			if( !dataCollector.IsTemplate )
			{
				UIUtils.ShowMessage( UniqueId, m_nodeAttribs.Name + " is not supported on surface shaders." );
				return m_outputPorts[0].ErrorValue;
			}

			if ( dataCollector.PortCategory == MasterNodePortCategory.Vertex )
			{
				UIUtils.ShowMessage( UniqueId, m_nodeAttribs.Name + " is not supported on Vertex ports" );
				return m_outputPorts[0].ErrorValue;
			}
			
			return dataCollector.TemplateDataCollectorInstance.GetPrimitiveId();
		}
	}
}