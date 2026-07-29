import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure ContinuedFractionExpansionPackage where
  α : ℝ
  convergents : List ℚ
  periodic : Prop
  eventuallyPeriodic : Prop
  quadratic : Prop
  convergentsConverge : Prop

structure ContinuedFractionExpansionEvidence (C : ContinuedFractionExpansionPackage) where
  convergentsConvergeClosed : C.convergentsConverge
  periodicImpliesQuadratic : C.periodic → C.quadratic

def ContinuedFractionExpansionClosed (C : ContinuedFractionExpansionPackage) : Prop :=
  C.convergentsConverge ∧ (C.periodic → C.quadratic)

theorem continued_fraction_expansion_closed_from_evidence (C : ContinuedFractionExpansionPackage)
    (Ev : ContinuedFractionExpansionEvidence C) : ContinuedFractionExpansionClosed C := by
  exact And.intro Ev.convergentsConvergeClosed Ev.periodicImpliesQuadratic

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse