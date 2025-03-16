// Advanced Dissolve <https://u3d.as/16cX>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;


namespace AmazingAssets.AdvancedDissolve.Examples
{
    public class MouseMove : MonoBehaviour
    {
        // Update is called once per frame 
        void Update()
        {
            if (ExampleInput.GetKeyLeftShift() == false &&
                ExampleInput.GetKeyRightShift() == false &&
                (ExampleInput.GetKeyLeftControl() || ExampleInput.GetKeyRightControl()))
            {
                transform.position -= transform.up * ExampleInput.GetMouseScrollDeltaY();
            }
        }
    }
}
