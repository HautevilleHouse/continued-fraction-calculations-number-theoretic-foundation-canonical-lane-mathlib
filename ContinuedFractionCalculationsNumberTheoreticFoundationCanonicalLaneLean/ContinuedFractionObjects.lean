import canonicalLaneMathlib.CanonicalCore
import Mathlib.NumberTheory.ContinuedFraction

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure ContinuedFractionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ContinuedFractionAdmittedObject where
  space : ContinuedFractionSpace
  infiniteContinuedFraction : Prop
  irrationalNumber : Prop
  quadraticIrrational : Prop
  periodicExpansion : Prop
  discriminant : ℕ
  conclusion : periodicExpansion

def ContinuedFractionWitnessClosed (O : ContinuedFractionAdmittedObject) : Prop :=
  O.periodicExpansion

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse