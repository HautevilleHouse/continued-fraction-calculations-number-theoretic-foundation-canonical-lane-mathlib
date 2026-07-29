import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure EuclideanAlgorithmPackage where
  a : ℕ
  b : ℕ
  gcd : ℕ
  steps : ℕ
  algorithmTerminates : Prop
  gcdComputes : Prop

structure EuclideanAlgorithmEvidence (E : EuclideanAlgorithmPackage) where
  algorithmTerminatesClosed : E.algorithmTerminates
  gcdComputesClosed : E.gcdComputes

def EuclideanAlgorithmClosed (E : EuclideanAlgorithmPackage) : Prop :=
  E.algorithmTerminates ∧ E.gcdComputes

theorem euclidean_algorithm_closed_from_evidence (E : EuclideanAlgorithmPackage)
    (Ev : EuclideanAlgorithmEvidence E) : EuclideanAlgorithmClosed E := by
  exact And.intro Ev.algorithmTerminatesClosed Ev.gcdComputesClosed

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse