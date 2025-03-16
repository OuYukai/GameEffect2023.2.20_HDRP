// Advanced Dissolve <https://u3d.as/16cX>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;
using UnityEditor.Rendering.HighDefinition;


namespace AmazingAssets.AdvancedDissolve.Editor.ShaderGraph
{
    public class ShaderGraphGUI : LightingShaderGraphGUI
    {
        public ShaderGraphGUI()
        {
            // Insert Advanced Dissolve UI Block in the end
            uiBlocks.Insert(uiBlocks.Count - 1, new AdvancedDissolveUIBlock(MaterialUIBlock.ExpandableBit.User0));
        }

        public override void ValidateMaterial(Material material)
        {
            base.ValidateMaterial(material);


            AmazingAssets.AdvancedDissolve.AdvancedDissolveKeywords.Reload(material);
        }
    }
}
