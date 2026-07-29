import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure ConvergentApproximations where
  n : Nat
  a : Nat
  b : Nat
  p : Nat
  q : Nat
  error : Rat

structure ConvergentApproximationsEvidence (C : ConvergentApproximations) where
  qPositive : C.q > 0
  pqRelation : C.a * C.q - C.b * C.p = if C.n % 2 = 0 then 1 else -1
  errorBound : C.error = |(C.a / C.b : ℚ) - ((C.p : ℚ) / (C.q : ℚ))|

def ConvergentApproximationsClosed (C : ConvergentApproximations) : Prop :=
  C.q > 0 ∧ C.a * C.q - C.b * C.p = (if C.n % 2 = 0 then 1 else -1) ∧
  C.error = |(C.a / C.b : ℚ) - ((C.p : ℚ) / (C.q : ℚ))|

theorem convergent_approximations_closed_from_evidence (C : ConvergentApproximations) (Ev : ConvergentApproximationsEvidence C) : ConvergentApproximationsClosed C := by
  exact And.intro Ev.qPositive (And.intro Ev.pqRelation Ev.errorBound)

structure AdmissibleClass where
  object : ConvergentApproximations
  endpointSatisfied : ConvergentApproximationsClosed object
  remainderRecorded : Prop
  gateWitness : ConvergentApproximationsClosed object ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop := ConvergentApproximationsClosed A.object

def gateClosed (A : AdmissibleClass) : Prop := ConvergentApproximationsClosed A.object ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.endpointSatisfied

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedConvergentClosure (A : AdmissibleClass) : Prop := bridgeClosed A ∧ gateClosed A

theorem constrained_convergent_endgame (A : AdmissibleClass) : ConstrainedConvergentClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse