#!/bin/bash

nums1=(3 8 4 10 12 15 18 17 2 1 3)
nums2=(4 6 3 14 3 25 5 8 9 12 11)

for i in "${!nums1[@]}"; do
  echo "la suma de ${nums1[i]} + ${nums2[i]} = $((nums1[i] + nums2[i]))"
done