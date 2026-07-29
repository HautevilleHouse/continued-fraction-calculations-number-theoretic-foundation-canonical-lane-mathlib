import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean.EuclideanAlgorithmStructure

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure ContinuedFractionPackage (E : EuclideanAlgorithmPackage) where
  partialQuotients : List Nat
  convergents : List (Nat × Nat)
  recurrenceRelation : Prop
  convergenceRate : Prop
  bestApproximation : Prop

structure ContinuedFractionEvidence {E : EuclideanAlgorithmPackage}
    (C : ContinuedFractionPackage E) where
  recurrenceRelationClosed : C.recurrenceRelation
  convergenceRateClosed : C.convergenceRate
  bestApproximationClosed : C.bestApproximation

def ContinuedFractionClosed {E : EuclideanAlgorithmPackage}
    (C : ContinuedFractionPackage E) : Prop :=
  C.recurrenceRelation ∧ C.convergenceRate ∧ C.bestApproximation

theorem continued_fraction_closed_from_evidence {E : EuclideanAlgorithmPackage}
    (C : ContinuedFractionPackage E) (ev : ContinuedFractionEvidence C) :
    ContinuedFractionClosed C :=
  And.intro ev.recurrenceRelationClosed (And.intro ev.convergenceRateClosed ev.bestApproximationClosed)

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse
