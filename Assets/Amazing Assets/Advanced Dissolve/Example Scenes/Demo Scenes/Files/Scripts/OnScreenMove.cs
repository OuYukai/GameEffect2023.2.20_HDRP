// Advanced Dissolve <https://u3d.as/16cX>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;


namespace AmazingAssets.AdvancedDissolve.Examples
{
    public class OnScreenMove : MonoBehaviour
    {
        [Space(10)]
        public Transform target;

        public float speed = 8.0f;
        public float distanceFromCamera = 5.0f;

        public float minDistance = 5;
        public float maxDistance = 30;


        Vector3 initialPosition;

        void Start()
        {
            initialPosition = transform.position;
        }

        void Update()
        {
            if (ExampleInput.GetKeyLeftControl())
            {
                Vector3 mousePosition = ExampleInput.MousePosition();
                mousePosition.z = distanceFromCamera + (Vector3.Distance(Camera.main.transform.position, target.position) - 20);

                initialPosition = Camera.main.ScreenToWorldPoint(mousePosition);

                Vector3 position = Vector3.Lerp(transform.position, initialPosition, 1.0f - Mathf.Exp(-speed * Time.deltaTime));

                if (position.y < 8)
                    position.y = 8;

                transform.position = position;

                distanceFromCamera += ExampleInput.GetMouseScrollDeltaY();
                distanceFromCamera = Mathf.Clamp(distanceFromCamera, minDistance, maxDistance);
            }
            else
            {
                Vector3 position = Vector3.Lerp(transform.position, initialPosition, 1.0f - Mathf.Exp(-speed * Time.deltaTime));

                if (position.y < 8)
                    position.y = 8;

                transform.position = position;
            }
        }
    }
}
