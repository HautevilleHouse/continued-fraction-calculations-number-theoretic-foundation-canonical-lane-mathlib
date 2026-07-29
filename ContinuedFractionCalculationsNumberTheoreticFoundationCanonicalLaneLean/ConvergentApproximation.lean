import canonicalLaneMathlib.AdmissibleClass
import Mathlib.NumberTheory.ContinuedFraction

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure ConvergentApproximationPackage where
  partialQuotients : ℕ → ℕ
  convergents : ℕ → ℚ
  errorBound : ℕ → ℚ
  rationalApproximations : Prop
  convergenceRate : Prop
  bestApproximationProperty : Prop

structure ConvergentApproximationEvidence (C : ConvergentApproximationPackage) where
  rationalApproximationsClosed : C.rationalApproximations
  convergenceRateClosed : C.convergenceRate
  bestApproximationPropertyClosed : C.bestApproximationProperty

def ConvergentApproximationClosed (C : ConvergentApproximationPackage) : Prop :=
  C.rationalApproximations ∧ C.convergenceRate ∧ C.bestApproximationProperty

theorem convergent_approximation_closed_from_evidence
    (C : ConvergentApproximationPackage) (E : ConvergentApproximationEvidence C) :
    ConvergentApproximationClosed C := by
  exact And.intro E.rationalApproximationsClosed
    (And.intro E.convergenceRateClosed E.bestApproximationPropertyClosed)

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse