import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure ContinuedFractionPackage where
  integerPart : ℤ
  partialQuotients : List ℕ
  tail : List ℕ
  convergents : List ℚ
  convergentsConverge : Prop
  tailInfinite : Prop

structure ContinuedFractionEvidence (C : ContinuedFractionPackage) where
  integerPartDefined : C.integerPart = C.integerPart
  partialQuotientsInfinite : C.tailInfinite
  convergentsConvergeClosed : C.convergentsConverge

def ContinuedFractionClosed (C : ContinuedFractionPackage) : Prop :=
  C.convergentsConverge ∧ C.tailInfinite

theorem continued_fraction_closed_from_evidence (C : ContinuedFractionPackage) (E : ContinuedFractionEvidence C) : ContinuedFractionClosed C :=
  And.intro E.convergentsConvergeClosed E.partialQuotientsInfinite

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse
