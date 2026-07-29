import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean.ContinuedFractionConvergence

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure QuadraticIrrationalPackage {E : EuclideanAlgorithmPackage}
    (C : ContinuedFractionPackage E) where
  radicand : Nat
  isPeriodic : Prop
  periodLength : Nat
  fundamentalUnit : (Nat × Nat)
  classGroupInfo : Prop

structure QuadraticIrrationalEvidence {E : EuclideanAlgorithmPackage}
    {C : ContinuedFractionPackage E} (Q : QuadraticIrrationalPackage C) where
  isPeriodicClosed : Q.isPeriodic
  periodLengthClosed : Q.periodLength = List.length (periodDigits Q)
  fundamentalUnitClosed : IsFundamentalUnit Q.fundamentalUnit
  classGroupInfoClosed : Q.classGroupInfo

def QuadraticIrrationalClosed {E : EuclideanAlgorithmPackage}
    {C : ContinuedFractionPackage E} (Q : QuadraticIrrationalPackage C) : Prop :=
  Q.isPeriodic ∧ (Q.periodLength = List.length (periodDigits Q)) ∧
  IsFundamentalUnit Q.fundamentalUnit ∧ Q.classGroupInfo

theorem quadratic_irrational_closed_from_evidence {E : EuclideanAlgorithmPackage}
    {C : ContinuedFractionPackage E} (Q : QuadraticIrrationalPackage C)
    (ev : QuadraticIrrationalEvidence Q) : QuadraticIrrationalClosed Q :=
  And.intro ev.isPeriodicClosed (And.intro ev.periodLengthClosed
    (And.intro ev.fundamentalUnitClosed ev.classGroupInfoClosed))

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse
