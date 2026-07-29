import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure BestApproximationPackage where
  target : ℝ
  denominatorBound : ℕ
  bestRationals : List ℚ
  bestApproximationProperty : Prop
  errorBound : ℚ → ℚ

structure BestApproximationEvidence (B : BestApproximationPackage) where
  bestApproximationPropertyClosed : B.bestApproximationProperty
  errorBoundComputed : ∀ q ∈ B.bestRationals, B.errorBound q < (1 : ℚ) / (B.denominatorBound : ℚ)^2

def BestApproximationClosed (B : BestApproximationPackage) : Prop :=
  B.bestApproximationProperty

theorem best_approximation_closed_from_evidence (B : BestApproximationPackage) (E : BestApproximationEvidence B) : BestApproximationClosed B :=
  E.bestApproximationPropertyClosed

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse
