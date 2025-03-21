// Advanced Dissolve <https://u3d.as/16cX>
// Copyright (c) Amazing Assets <https://amazingassets.world>
 
using System.Linq;
using System.Collections.Generic;

using UnityEngine;


namespace AmazingAssets.AdvancedDissolve.Examples
{
    [ExecuteInEditMode]
    public class MaterialCollector : MonoBehaviour
    {
        public AdvancedDissolveKeywordsController keywordsController;
        public AdvancedDissolvePropertiesController propertiesController;
        public AdvancedDissolveGeometricCutoutController geometricCutoutController;

        public bool enableCutoutForHDRP;

        // Use this for initialization
        void Start()
        {
            //Find all materials with Dissolve shader
            List<Material> mats = new List<Material>();

            Renderer[] renderers = (Renderer[])Resources.FindObjectsOfTypeAll(typeof(Renderer));
            if (renderers != null)
            {
                for (int i = 0; i < renderers.Length; i++)
                {
                    if (renderers[i] == null || renderers[i].sharedMaterials == null)
                        continue;

                    mats.AddRange(renderers[i].sharedMaterials.Where(c => c != null && mats.Contains(c) == false && Utilities.ShaderIsAdvancedDissolve(c.shader)));
                }
                            
                //In Unity 2020.2 HDRP material needs manual keyword activation for 'cutout' effect
                if(enableCutoutForHDRP)
                {
                    for (int i = 0; i < mats.Count; i++)
                    {
                        mats[i].EnableKeyword("_ALPHATEST_ON");
                    }
                }
            }


            keywordsController.materials = mats.ToList();
            keywordsController.ForceUpdateShaderData();

            propertiesController.ForceUpdateShaderData();
            geometricCutoutController.ForceUpdateShaderData();
        }
    }
}
