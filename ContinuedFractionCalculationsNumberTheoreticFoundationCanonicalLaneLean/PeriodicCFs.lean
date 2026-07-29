import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure PeriodicCF where
  periodicPart : List Nat
  prePeriod : List Nat
  value : ℚ
  minimalPeriod : Nat

structure PeriodicCFEvidence (P : PeriodicCF) where
  valueClosed : P.value = (continuedFraction (prePeriod ++ periodicPart) : ℚ)
  minimalPeriodClosed : P.minimalPeriod = periodLength (prePeriod ++ periodicPart)
  irrationallyDefined : P.value ∉ ℕ

def PeriodicCFClosed (P : PeriodicCF) : Prop :=
  P.value = (continuedFraction (P.prePeriod ++ P.periodicPart) : ℚ) ∧
  P.minimalPeriod = periodLength (P.prePeriod ++ P.periodicPart) ∧
  P.value ∉ ℕ

theorem periodic_cf_closed_from_evidence (P : PeriodicCF) (Ev : PeriodicCFEvidence P) : PeriodicCFClosed P := by
  exact And.intro Ev.valueClosed (And.intro Ev.minimalPeriodClosed Ev.irrationallyDefined)

structure AdmissibleClass where
  object : PeriodicCF
  endpointSatisfied : PeriodicCFClosed object
  remainderRecorded : Prop
  gateWitness : PeriodicCFClosed object ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop := PeriodicCFClosed A.object

def gateClosed (A : AdmissibleClass) : Prop := PeriodicCFClosed A.object ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.endpointSatisfied

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedPeriodicCFClosure (A : AdmissibleClass) : Prop := bridgeClosed A ∧ gateClosed A

theorem constrained_periodic_cf_endgame (A : AdmissibleClass) : ConstrainedPeriodicCFClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse