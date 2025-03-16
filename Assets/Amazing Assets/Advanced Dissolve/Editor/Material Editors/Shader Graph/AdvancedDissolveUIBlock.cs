// Advanced Dissolve <https://u3d.as/16cX>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEditor.Rendering;
using UnityEditor.Rendering.HighDefinition;


namespace AmazingAssets.AdvancedDissolve.Editor
{
    public class AdvancedDissolveUIBlock : MaterialUIBlock
    {
        ExpandableBit foldoutBit;

        public AdvancedDissolveUIBlock(ExpandableBit expandableBit)
        {
            foldoutBit = expandableBit;
        }

        public override void LoadMaterialProperties()
        {
            AmazingAssets.AdvancedDissolve.Editor.AdvancedDissolveMaterialProperties.Init(properties);
        }

        public override void OnGUI()
        {
            using (var header = new MaterialHeaderScope(new UnityEngine.GUIContent("Advanced Dissolve"), (uint)foldoutBit, materialEditor))
            {
                if (header.expanded)
                {
                    AmazingAssets.AdvancedDissolve.Editor.AdvancedDissolveMaterialProperties.DrawDissolveOptions(false, materialEditor, true, true, false, true, true, true);
                }
            }
        }
    }
}