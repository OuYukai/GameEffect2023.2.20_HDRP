// Advanced Dissolve <https://u3d.as/16cX>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;


namespace AmazingAssets.AdvancedDissolve.Examples
{
    public class Hover : MonoBehaviour
    {

        // Use this for initialization
        void Start()
        {

        }

        // Update is called once per frame
        void Update()
        {
            transform.localPosition = new Vector3(0, Mathf.Sin(Time.realtimeSinceStartup * 1.2f) * 0.1f, 0);
        }
    }
}
