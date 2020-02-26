
Shader "Custom/surfacedifuse" 
{
    Properties 
    {
        _Albedo ("Albedo Color", Color) = (1, 1, 1, 1)
    }

    SubShader 
    {
        Tags
        {
            "Queve" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM

        float4 _Albedo;
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_MainText;

        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Albedo;
        }

        ENDCG
    }
}