import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure QuadraticIrrationalPackage where
  d : ℕ
  representation : ℚ + ℚ[√d]
  periodicity : Prop
  purelyPeriodic : Prop
  eventuallyPeriodic : Prop

structure QuadraticIrrationalEvidence (Q : QuadraticIrrationalPackage) where
  periodicityClosed : Q.periodicity
  eventuallyPeriodicClosed : Q.eventuallyPeriodic

def QuadraticIrrationalClosed (Q : QuadraticIrrationalPackage) : Prop :=
  Q.periodicity ∧ Q.eventuallyPeriodic

theorem quadratic_irrational_closed_from_evidence (Q : QuadraticIrrationalPackage) (E : QuadraticIrrationalEvidence Q) : QuadraticIrrationalClosed Q :=
  And.intro E.periodicityClosed E.eventuallyPeriodicClosed

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse
