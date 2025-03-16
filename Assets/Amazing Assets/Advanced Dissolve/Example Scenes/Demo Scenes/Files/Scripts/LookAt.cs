// Advanced Dissolve <https://u3d.as/16cX>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;


namespace AmazingAssets.AdvancedDissolve.Examples
{
    [ExecuteInEditMode]
    public class LookAt : MonoBehaviour
    {
        public Transform target;

        // Update is called once per frame
        void Update()
        {
            if (target != null)
                transform.LookAt(target);
        }
    }
}
