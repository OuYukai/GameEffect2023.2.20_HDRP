// Advanced Dissolve <https://u3d.as/16cX>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;


namespace AmazingAssets.AdvancedDissolve.Examples
{
    public class LookAtMouse : MonoBehaviour
    {
        public static Vector3 mouseWorldPosition;

        // Use this for initialization
        void Start()
        {
            mouseWorldPosition = new Vector3(0, 8, -3);
        }

        // Update is called once per frame
        void Update()
        {
            if (ExampleInput.GetKeyLeftControl())
            {
                Ray ray = Camera.main.ScreenPointToRay(ExampleInput.MousePosition());
                RaycastHit hit;

                if (Physics.Raycast(ray, out hit))
                {
                    mouseWorldPosition = hit.point;
                }

            }

            transform.LookAt(mouseWorldPosition);
        }
    }
}
