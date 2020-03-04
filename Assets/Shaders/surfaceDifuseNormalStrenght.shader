Shader "Custom/surfaceDifuseNormalStrenght"
{
    Properties
    {
        _Albedo("Albedo Color", Color) = (1, 1, 1, 1)
        _MainTex("Main Texture", 2D) = "white" {}
        _NormalTex("Normal Texture", 2D) = "bump" {}
        _NormalStrenght("Normal Strength", Range(-5, 5)) = 1

    }

    SubShader
{
    Tags
    {
        "Queue" = "Geometry"
        "RenderType" = "Opaque"

    }

    CGPROGRAM

       half4 _Albedo;
       sampler2D _MainTex;
       sampler2D _NormalTex;
       float _NormalStrenght;

       #pragma surface surf Lambert

       struct Input
       {
           float2 uv_MainTex;
           float2 uv_NormalTex;

       };

       void surf( Input IN, inout SurfaceOutput o)
       {
           half4 texColor = tex2D(_MainTex, IN.uv_MainTex);
           o.Albedo = _Albedo * texColor.rgb;

           half4 normalColor = tex2D(_NormalTex, IN.uv_NormalTex);
           half3 normal = UnpackNormal(normalColor);
           normal.z = normal.z / _NormalStrenght;
           o.Normal = normalize(normal);

       }

    ENDCG
}

}

