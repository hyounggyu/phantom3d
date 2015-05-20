#!/usr/local/bin/MathematicaScript -script

<<Phantom3D`

regions = Table[Phantom3DTransformedRegion[{RotationTransform[th, {0, 0, 1}],
            TranslationTransform[{0.5 Cos[th], 0.5 Sin[th], 0.2 Sin[th]}]}], {th, 0, Pi, Pi/90}]

Block[{max = 1.5, i},
 For[i = 1, i <= Length[regions], i++,
  Print@DateList[TimeZone -> 9];
  Print[i];
  image = Phantom3DRegionToImage3D[regions[[i]], 420, max];
  Export["data" <> ToString [i] <> ".h5", ImageData@image];
  Clear[image];
 ]
]
