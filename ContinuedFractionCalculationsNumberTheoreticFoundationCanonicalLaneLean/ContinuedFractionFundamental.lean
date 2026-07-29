import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure ContinuedFractionObject where
  continuedFraction : List ℤ
  tail : List ℤ
  inputRational : ℚ
  approximation : ℚ

structure AdmittedObject where
  cfo : ContinuedFractionObject
  convergenceValid : Prop
  rationalApproximation : Prop
  conclusion : convergenceValid ∧ rationalApproximation

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse