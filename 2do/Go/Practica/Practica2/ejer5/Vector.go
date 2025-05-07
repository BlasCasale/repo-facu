package ejer5

type Vector [5]float64

func Initialize(v *Vector, f float64) {
	for i := range v {
		v[i] = f
	}
}

func Sum(v1, v2 Vector) Vector {
	var v3 Vector

	for i := range v3 {
		v3[i] = v1[i] + v2[i]
	}

	return v3
}

func SumInPlace(v1 *Vector, v2 Vector) {
	for i := range v1 {
		v1[i] = v1[i] + v2[i]
	}
}
