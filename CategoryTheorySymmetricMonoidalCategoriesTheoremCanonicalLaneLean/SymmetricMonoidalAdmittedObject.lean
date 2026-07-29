import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SymmetricMonoidalAdmittedObject where
  category : SymmetricMonoidalCategory
  object : category.obj
  tensorCompatibility : Prop
  braidingCoherence : Prop
  conclusion : tensorCompatibility ∧ braidingCoherence

def SymmetricMonoidalWitnessClosed (O : SymmetricMonoidalAdmittedObject) : Prop :=
  O.tensorCompatibility ∧ O.braidingCoherence

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse