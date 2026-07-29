import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure EuclidAlgorithmStep where
  dividend : ℕ
  divisor : ℕ
  quotient : ℕ
  remainder : ℕ

structure ConvergentAlgorithmPackage where
  steps : List EuclidAlgorithmStep
  convergents : List ℚ
  algorithmTerminates : Prop
  correctness : Prop

structure ConvergentAlgorithmEvidence (C : ConvergentAlgorithmPackage) where
  algorithmTerminatesClosed : C.algorithmTerminates
  correctnessClosed : C.correctness

def ConvergentAlgorithmClosed (C : ConvergentAlgorithmPackage) : Prop :=
  C.algorithmTerminates ∧ C.correctness

theorem convergent_algorithm_closed_from_evidence (C : ConvergentAlgorithmPackage)
    (E : ConvergentAlgorithmEvidence C) : ConvergentAlgorithmClosed C := by
  exact And.intro E.algorithmTerminatesClosed E.correctnessClosed

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse