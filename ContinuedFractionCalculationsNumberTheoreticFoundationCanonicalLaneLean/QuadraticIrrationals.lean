import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure QuadraticIrrationalPackage where
  d : ℕ
  periodLength : ℕ
  fundamentalUnit : ℚ
  classNumber : ℕ
  periodicCF : Prop
  unitComputed : Prop

structure QuadraticIrrationalEvidence (Q : QuadraticIrrationalPackage) where
  periodicCFClosed : Q.periodicCF
  unitComputedClosed : Q.unitComputed

def QuadraticIrrationalClosed (Q : QuadraticIrrationalPackage) : Prop :=
  Q.periodicCF ∧ Q.unitComputed

theorem quadratic_irrational_closed_from_evidence (Q : QuadraticIrrationalPackage)
    (Ev : QuadraticIrrationalEvidence Q) : QuadraticIrrationalClosed Q := by
  exact And.intro Ev.periodicCFClosed Ev.unitComputedClosed

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse