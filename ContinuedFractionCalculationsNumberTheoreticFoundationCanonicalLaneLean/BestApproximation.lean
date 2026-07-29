import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure BestApproximationProperty where
  denominatorBound : ℕ
  approximationQuality : Prop
  bestInClass : Prop

structure BestApproximationPackage where
  property : BestApproximationProperty
  uniqueness : Prop
  qualityBound : Prop

structure BestApproximationEvidence (B : BestApproximationPackage) where
  uniquenessClosed : B.uniqueness
  qualityBoundClosed : B.qualityBound

def BestApproximationClosed (B : BestApproximationPackage) : Prop :=
  B.uniqueness ∧ B.qualityBound

theorem best_approximation_closed_from_evidence (B : BestApproximationPackage)
    (E : BestApproximationEvidence B) : BestApproximationClosed B := by
  exact And.intro E.uniquenessClosed E.qualityBoundClosed

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse