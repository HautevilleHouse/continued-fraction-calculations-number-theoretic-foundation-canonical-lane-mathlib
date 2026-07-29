import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure EuclideanAlgorithmPackage where
  dividend : Nat
  divisor : Nat
  quotient : Nat
  remainder : Nat
  loopInvariant : Prop
  terminationMeasure : Nat
  invariantPreservation : Prop

structure EuclideanAlgorithmEvidence (E : EuclideanAlgorithmPackage) where
  loopInvariantClosed : E.loopInvariant
  terminationMeasureClosed : terminationMeasure E = 0
  invariantPreservationClosed : E.invariantPreservation

def EuclideanAlgorithmClosed (E : EuclideanAlgorithmPackage) : Prop :=
  E.loopInvariant ∧ (E.terminationMeasure = 0) ∧ E.invariantPreservation

theorem euclidean_algorithm_closed_from_evidence (E : EuclideanAlgorithmPackage)
    (ev : EuclideanAlgorithmEvidence E) : EuclideanAlgorithmClosed E :=
  And.intro ev.loopInvariantClosed (And.intro ev.terminationMeasureClosed ev.invariantPreservationClosed)

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse
