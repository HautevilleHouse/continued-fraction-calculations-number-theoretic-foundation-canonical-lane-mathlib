import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure ContinuedFractionMeasurePackage where
  gaussMap : ℝ → ℝ
  invariantMeasure : MeasureTheory.Measure ℝ
  ergodicity : Prop
  entropy : ℝ
  distributionProperties : Prop

structure ContinuedFractionMeasureEvidence (M : ContinuedFractionMeasurePackage) where
  ergodicityClosed : M.ergodicity
  entropyComputed : M.entropy > 0
  distributionPropertiesClosed : M.distributionProperties

def ContinuedFractionMeasureClosed (M : ContinuedFractionMeasurePackage) : Prop :=
  M.ergodicity ∧ M.distributionProperties

theorem continued_fraction_measure_closed_from_evidence (M : ContinuedFractionMeasurePackage) (E : ContinuedFractionMeasureEvidence M) : ContinuedFractionMeasureClosed M :=
  And.intro E.ergodicityClosed E.distributionPropertiesClosed

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse
