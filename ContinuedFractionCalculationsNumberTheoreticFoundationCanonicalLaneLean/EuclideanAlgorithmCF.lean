import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure EuclideanAlgorithmCF where
  a : Nat
  b : Nat
  gcd : Nat
  quotients : List Nat
  remainders : List Nat

structure EuclideanAlgorithmCFEvidence (E : EuclideanAlgorithmCF) where
  aClosed : E.a ≠ 0
  bClosed : E.b ≠ 0
  gcdClosed : E.gcd = Nat.gcd E.a E.b
  quotientsClosed : (List.sum (List.zipWith (*) (E.quotients) (E.remainders))) = E.a
  remaindersClosed : (List.sum (List.zipWith (*) (E.remainders) (E.quotients))) = E.b

def EuclideanAlgorithmCFClosed (E : EuclideanAlgorithmCF) : Prop :=
  E.a ≠ 0 ∧ E.b ≠ 0 ∧ E.gcd = Nat.gcd E.a E.b ∧
  (List.sum (List.zipWith (*) (E.quotients) (E.remainders))) = E.a ∧
  (List.sum (List.zipWith (*) (E.remainders) (E.quotients))) = E.b

theorem euclidean_algorithm_cf_closed_from_evidence (E : EuclideanAlgorithmCF) (Ev : EuclideanAlgorithmCFEvidence E) : EuclideanAlgorithmCFClosed E := by
  exact And.intro Ev.aClosed (And.intro Ev.bClosed (And.intro Ev.gcdClosed (And.intro Ev.quotientsClosed Ev.remaindersClosed)))

structure AdmissibleClass where
  object : EuclideanAlgorithmCF
  endpointSatisfied : EuclideanAlgorithmCFClosed object
  remainderRecorded : Prop
  gateWitness : EuclideanAlgorithmCFClosed object ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop := EuclideanAlgorithmCFClosed A.object

def gateClosed (A : AdmissibleClass) : Prop := EuclideanAlgorithmCFClosed A.object ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.endpointSatisfied

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedCFClosure (A : AdmissibleClass) : Prop := bridgeClosed A ∧ gateClosed A

theorem constrained_cf_endgame (A : AdmissibleClass) : ConstrainedCFClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse